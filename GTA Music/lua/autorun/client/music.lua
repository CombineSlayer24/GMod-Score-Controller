--[[

This script is still a work in progress.

]]
local MUSIC_BASE_PATH = "sound/"  -- Base path for all music files
local MAX_STEMS = 12  -- Maximum stems supported (for networking and validation)

local currentSet = "alc_vodka"
local currentStems = {} 
local stemStates = {}
local stemVolumes = {}  -- Current volume for each stem (for fading)
local currentIntensity = nil  -- Track current intensity level
local isChangingSet = false  -- Flag to prevent concurrent set changes
local nextIntensityTime = 0  -- Time for next random intensity change
local musicSets = CLIENT and include( "autorun/client/music_data.lua" ) or {}  -- Load music sets only on client
local expandedCategories = {}
local stemBaseVolumeMultipliers = {}  -- Linear multiplier per stem (from dB adjustments)

-- Client menu state
if CLIENT then StemControllerMenu = StemControllerMenu or {} end

-- Client convars
local cvMusicVolume = CreateClientConVar( "StemController_volume", "0.6", true, false, "Overall music volume (0-1)" )
local cvFadeTime = CreateClientConVar( "StemController_fadetime", "2.0", true, false, "Fade in/out duration in seconds", 0, 10 )
local cvPlaybackRate = CreateClientConVar( "StemController_playbackrate", "1.0", true, false, "Playback speed multiplier", 0.5, 2 )
local cvDebug = CreateClientConVar( "StemController_debug", "0", true, false, "Enable debug prints and HUD (1=on)" )
local cvMusicSet = CreateClientConVar( "StemController_setname", "alc_vodka", true, false, "Music set to play (alc_vodka, alc_pb2_pussyface, nrt4, nybar, cemetery, td_vacuum)" )
local cvRandomIntensity = CreateClientConVar( "StemController_intensitysequences", "0", true, false, "Randomly switch intensity sequences every 30 seconds." )
local cvRandomSet = CreateClientConVar( "StemController_randomset", "1", true, false, "Randomize music set on spawn (1=on)" )

-- Lua shortcuts
local CurTime = CurTime
local IsValid = IsValid
local Lerp = Lerp
local fileExists = file.Exists
local soundPlayFile = sound.PlayFile
local utilPrecacheSound = util.PrecacheSound
local hookAdd = hook.Add
local hookRemove = hook.Remove
local timerSimple = timer.Simple
local timerCreate = timer.Create
local timerRemove = timer.Remove
local stringFormat = string.format
local mathFloor = math.floor
local concommandAdd = concommand.Add
local cvarsAddChangeCallback = cvars.AddChangeCallback
local tableConcat = table.concat
local tableGetKeys = table.GetKeys
local drawSimpleText = draw.SimpleText
local ScrW = ScrW
local ScrH = ScrH
local vguiCreate = vgui.Create
local mathRandom = math.random
local tableInsert = table.insert
local tableSort = table.sort
local mathClamp = math.Clamp
local mathMax = math.max
local surfaceSetFont = surface.SetFont
local surfaceGetTextSize = surface.GetTextSize
local randomIntensityTime = 31

-- Server networking
if SERVER then
	util.AddNetworkString( "StemController_SetSet" )
	util.AddNetworkString( "StemController_TriggerStem" )
	util.AddNetworkString( "StemController_TriggerIntensity" )
	util.AddNetworkString( "StemController_Volume" )
	util.AddNetworkString( "StemController_Stop" )
	util.AddNetworkString( "StemController_Randomize_Stems" )
end

local function FormatTime( seconds )
	local minutes = mathFloor( seconds / 60 )
	local secs = mathFloor( seconds % 60 )
	return stringFormat( "%02d:%02d", minutes, secs )
end

local function DebugPrint( ... )
	if cvDebug:GetBool() then
		print( "[StemController Debug]", ... )
	end
end

local function LoadMusicData( )
	musicSets = { } -- Ensure musicSets starts fresh each time

	-- Load main music data
	if CLIENT and file.Exists( "autorun/client/music_data.lua", "LUA" ) then
		local mainData = include( "autorun/client/music_data.lua" )
		if mainData and type( mainData ) == "table" then
			for set, data in pairs( mainData ) do
				musicSets[ set ] = data
			end
		end
	end

	-- Load modular music data files (e.g., music_data_{namehere}.lua)
	local files, _ = file.Find( "autorun/client/music_data_*.lua", "LUA" )
	for _, fileName in ipairs( files ) do
		local customData = include( "autorun/client/" .. fileName )
		if customData and type( customData ) == "table" then
			for set, data in pairs( customData ) do
				-- Allow overwriting only if the set doesn't exist, otherwise merge
				if not musicSets[ set ] then
					musicSets[ set ] = table.Copy( data ) -- Use table.Copy to avoid reference issues
				else
					-- Merge intensities if they exist, otherwise keep existing data
					if data.intensity and not musicSets[ set ].intensity then
						musicSets[ set ].intensity = table.Copy( data.intensity )
					end
					-- Update other fields if not present in existing set
					for k, v in pairs( data ) do
						if k ~= "intensity" and musicSets[ set ][ k ] == nil then
							musicSets[ set ][ k ] = v
						end
					end
				end
			end
		end
	end

	if table.IsEmpty( musicSets ) then
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available" )
		end
	end
end

-- Precache stems for a set
local precachedStems = { }
local function PrecacheStems( set )
	if not musicSets[ set ] then
		DebugPrint( "Invalid set:", set )
		return false
	end
	local path = musicSets[ set ].path
	if path and path:sub( -1 ) ~= "/" then
		path = path .. "/"
	end
	local folder = MUSIC_BASE_PATH .. path
	DebugPrint( "Precaching stems for set:", set )
	for i, fileName in ipairs( musicSets[ set ].stems ) do
		local filePath = folder .. fileName
		if fileExists( filePath, "GAME" ) then
			if not precachedStems[ filePath ] then
				utilPrecacheSound( filePath )
				precachedStems[ filePath ] = true
				DebugPrint( "Precached:", filePath )
			else
				DebugPrint( "Already precached:", filePath )
			end
		else
			DebugPrint( "Error: Missing stem:", filePath )
			return false
		end
	end
	return true
end


local uiSounds = { "ui/blip.wav", "ui/0x0E60F7B2.wav" }

for _, soundFile in ipairs( uiSounds ) do
	if fileExists( "sound/" .. soundFile, "GAME" ) then
		utilPrecacheSound( "sound/" .. soundFile )
	else
		DebugPrint( "Error: UI sound missing:", "sound/" .. soundFile )
	end
end

local function StartStems( set )
	-- Clean up old stems
	for stem, channel in pairs( currentStems ) do
		if IsValid( channel ) then
			channel:Stop()
			DebugPrint( "Stopped and unloaded stem:", stem )
		end
		currentStems[ stem ] = nil -- Remove reference
	end
	currentStems = {} -- Clear the table
	stemStates = {}
	stemVolumes = {}
	stemBaseVolumeMultipliers = {}  -- Clear base multipliers
	currentIntensity = nil
	timerRemove( "StemController_Randomize_Intensity" )
	DebugPrint( "Cleared old stems and related state" )

	if not musicSets[ set ] then
		DebugPrint( "Error: Invalid set:", set )
		return
	end

	local path = musicSets[ set ].path
	if path and path:sub( -1 ) ~= "/" then
		path = path .. "/"
	end
	local folder = MUSIC_BASE_PATH .. path
	local startTime = 0
	local stemCount = 0
	local expectedStems = #musicSets[ set ].stems

	for i, fileName in ipairs( musicSets[ set ].stems ) do
		local filePath = folder .. fileName
		if not fileExists( filePath, "GAME" ) then
			DebugPrint( "Error: Missing stem:", filePath )
			return
		end

		soundPlayFile( filePath, "noblock noplay", function( channel, errId, errName )
			if not IsValid( channel ) then
				DebugPrint( "Stem load failed:", errName, "(ID:", errId, ")" )
				return
			end

			channel:EnableLooping( true )
			channel:SetPlaybackRate( cvPlaybackRate:GetFloat() )
			channel:SetVolume( 0 )
			local duration = channel:GetLength() or 30
			channel:SetTime( startTime % duration )
			channel:Play()
			currentStems[ i ] = channel
			stemStates[ i ] = false
			stemVolumes[ i ] = 0

			-- Compute base multiplier from dB adjustment (new)
			local dbAdjustment = ( musicSets[ set ].stemVolumeAdjustment and musicSets[ set ].stemVolumeAdjustment[ i ] ) or 0
			local baseVolumeMultiplier = 10 ^ ( dbAdjustment / 20 )  -- dB to linear (e.g., -5 dB -> ~0.562)
			stemBaseVolumeMultipliers[ i ] = baseVolumeMultiplier
			DebugPrint( "Stem", i, "base dB:", dbAdjustment, "| multiplier:", baseVolumeMultiplier )

			stemCount = stemCount + 1
			DebugPrint( "Stem", i, "started | Duration:", FormatTime( duration ), "| Start:", FormatTime( startTime ), "| Active:", stemStates[ i ] )
		end )
	end

	timerSimple( 1, function()
		if stemCount < expectedStems then
			DebugPrint( "Error: Only", stemCount, "stems loaded, expected", expectedStems )
		else
			DebugPrint( "Loaded set:", set, "| All stems muted (no active stems)" )
		end
	end )

	if cvRandomIntensity:GetBool() and currentIntensity then
		timerCreate( "StemController_Randomize_Intensity", randomIntensityTime, 0, function()
			if currentIntensity and musicSets[ currentSet ] and musicSets[ currentSet ].intensity and musicSets[ currentSet ].intensity[ currentIntensity ] then
				TriggerIntensity( currentIntensity )
			end
		end )
	end
end

local function FadeStem( stem, targetVol )
	if not currentStems[ stem ] or not IsValid( currentStems[ stem ] ) then return end
	local duration = cvFadeTime:GetFloat()
	if duration <= 0 then
		local effectiveVol = targetVol * ( stemBaseVolumeMultipliers[ stem ] or 1 )  -- Apply base adjustment
		currentStems[ stem ]:SetVolume( effectiveVol )
		stemVolumes[ stem ] = effectiveVol
		DebugPrint( "Stem", stem, "set to effective volume:", effectiveVol, "(base mult:", stemBaseVolumeMultipliers[ stem ] or 1, ")" )
		return
	end

	local startTime = CurTime()
	local startVol = stemVolumes[ stem ] or 0
	local baseMult = stemBaseVolumeMultipliers[ stem ] or 1
	local effectiveTargetVol = targetVol * baseMult  -- Apply base adjustment
	local hookId = "StemController_FadeStem_" .. stem
	hookAdd( "Think", hookId, function()
		if not IsValid( currentStems[ stem ] ) then
			hookRemove( "Think", hookId )
			return
		end
		local progress = math.min( ( CurTime() - startTime ) / duration, 1 )
		-- Use quadratic interpolation for slow start and faster end
		local quadProgress = progress * progress  -- Quadratic curve: slow at start, faster at end
		local lerpedVol = Lerp( quadProgress, startVol, effectiveTargetVol )
		currentStems[ stem ]:SetVolume( lerpedVol )
		stemVolumes[ stem ] = lerpedVol
		if progress >= 1 then
			hookRemove( "Think", hookId )
			DebugPrint( "Stem", stem, "fade complete to effective volume:", effectiveTargetVol, "(base mult:", baseMult, ")" )
		end
	end )
end

-- Toggle stem on/off
local function TriggerStem( stem )
	if stemStates[ stem ] == nil then
		DebugPrint( "Invalid stem:", stem )
		return
	end
	stemStates[ stem ] = not stemStates[ stem ]
	local targetVol = stemStates[ stem ] and cvMusicVolume:GetFloat() or 0
	FadeStem( stem, targetVol )
	currentIntensity = nil
	timerRemove( "StemController_Randomize_Intensity" )
	DebugPrint( "Stem", stem, stemStates[ stem ] and "enabled" or "disabled" )
end

local comboIndex = {}

-- Trigger stems by intensity level
local function TriggerIntensity( intensity )
	local maxStems = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
	local intensityCombos = musicSets[ currentSet ] and musicSets[ currentSet ].intensity and musicSets[ currentSet ].intensity[ intensity ]
	if not intensityCombos then
		DebugPrint( "Invalid intensity or no combinations defined for set:", currentSet, intensity )
		return
	end

	-- Initialize combo index for the current set and intensity
	comboIndex[ currentSet ] = comboIndex[ currentSet ] or {}
	-- Randomize starting sequence when intensity changes
	if currentIntensity ~= intensity and type( intensityCombos[ 1 ] ) == "table" then
		comboIndex[ currentSet ][ intensity ] = mathRandom( 1, #intensityCombos )
	elseif currentIntensity == intensity and type( intensityCombos[ 1 ] ) == "table" then
		comboIndex[ currentSet ][ intensity ] = ( ( comboIndex[ currentSet ][ intensity ] or 0 ) % #intensityCombos ) + 1
	else
		comboIndex[ currentSet ][ intensity ] = 1 -- Single combination or no change
	end

	local selectedCombo
	if type( intensityCombos[ 1 ] ) == "table" then
		-- Multiple combinations: use the current sequence index
		selectedCombo = intensityCombos[ comboIndex[ currentSet ][ intensity ] ]
		DebugPrint( "Selected combo for intensity:", intensity, "| Sequence:", comboIndex[ currentSet ][ intensity ], "| Stems:", tableConcat( selectedCombo, ", " ) )
	else
		-- Single combination
		selectedCombo = intensityCombos
		comboIndex[ currentSet ][ intensity ] = 1 -- Always sequence 1 for single combos
		DebugPrint( "Single combo for intensity:", intensity, "| Stems:", tableConcat( selectedCombo, ", " ) )
	end

	-- Apply the selected combination
	for i = 1, maxStems do
		if stemStates[ i ] and not table.HasValue( selectedCombo, i ) then
			TriggerStem( i )
		end
	end
	for _, stem in ipairs( selectedCombo ) do
		if not stemStates[ stem ] then
			TriggerStem( stem )
		end
	end
	currentIntensity = intensity

	-- Handle random intensity cycling only if enabled
	if cvRandomIntensity:GetBool() and musicSets[ currentSet ] and musicSets[ currentSet ].intensity and type( intensityCombos[ 1 ] ) == "table" then
		nextIntensityTime = CurTime() + randomIntensityTime
		timerCreate( "StemController_Randomize_Intensity", randomIntensityTime, 1, function()
			if musicSets[ currentSet ] and musicSets[ currentSet ].intensity and musicSets[ currentSet ].intensity[ intensity ] then
				TriggerIntensity( intensity )
			end
		end )
	else
		timerRemove( "StemController_Randomize_Intensity" )
		nextIntensityTime = 0
	end
	DebugPrint( "Triggered intensity:", intensity, "| Selected combination:", tableConcat( selectedCombo, ", " ) )
end


-- Randomize stems
local function RandomizeStems()
	local stemCount = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
	local numStemsToEnable = mathRandom( 1, stemCount )
	local availableStems = {}
	for i = 1, stemCount do
		tableInsert( availableStems, i )
	end
	local selectedStems = {}
	for i = 1, numStemsToEnable do
		if #availableStems == 0 then break end
		local index = mathRandom( 1, #availableStems )
		local stem = table.remove( availableStems, index )
		tableInsert( selectedStems, stem )
	end
	for i = 1, stemCount do
		if table.HasValue( selectedStems, i ) then
			if not stemStates[ i ] then TriggerStem( i ) end
		else
			if stemStates[ i ] then TriggerStem( i ) end
		end
	end
	currentIntensity = nil
	timerRemove( "StemController_Randomize_Intensity" )
	nextIntensityTime = 0
	DebugPrint( "Randomized stems:", tableConcat( selectedStems, ", " ) )
end

-- Change music set
function ChangeMusicSet( mode, specificSet )
	if isChangingSet then return end
	isChangingSet = true

	local newSet
	if mode == "next" and specificSet then
		newSet = specificSet
	elseif mode == "random" then
		local sets = table.GetKeys( musicSets )
		newSet = sets[ math.random( 1, #sets ) ]
	elseif mode == "same_category" then
		local currentCategory = musicSets[ currentSet ] and musicSets[ currentSet ].category or ""
		local categorySets = {}
		for set, data in pairs( musicSets ) do
			if ( data.category or "" ) == currentCategory and set ~= currentSet then
				table.insert( categorySets, set )
			end
		end
		if #categorySets > 0 then
			newSet = categorySets[ math.random( 1, #categorySets ) ]
		else
			local sets = table.GetKeys( musicSets )
			newSet = sets[ math.random( 1, #sets ) ]
			if CLIENT then
				chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "No other sets in category, selecting random set" )
			end
		end
	elseif mode == "next" then
		local sets = table.GetKeys( musicSets )
		table.sort( sets )
		local currentIndex = table.KeyFromValue( sets, currentSet ) or 1
		newSet = sets[ currentIndex + 1 ] or sets[ 1 ]
	end

	if newSet then
		RunConsoleCommand( "StemController_setname", newSet )
	else
		isChangingSet = false
	end
end

-- Reload music data table
local function ReloadMusicData()
	local oldSet = currentSet
	musicSets = {} -- Clear existing musicSets table
	precachedStems = {} -- Clear precache to ensure new stems are precached

	-- Load music data
	LoadMusicData()

	-- Check if musicSets is populated
	if not musicSets or table.IsEmpty( musicSets ) then
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: Failed to reload music data, no sets available" )
			surface.PlaySound( "ui/error.wav" )
		end
		DebugPrint( "Error: Failed to reload music data, musicSets is empty" )
		currentSet = "alc_vodka" -- Fallback to default set
		return
	end

	-- Notify client of successful reload
	if CLIENT then
		chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Music data reloaded successfully" )
		surface.PlaySound( "ui/0x0E60F7B2.wav" )
	end
	DebugPrint( "Music data reloaded, sets available:", tableConcat( tableGetKeys( musicSets ), ", " ) )

	-- Update UI if menu is open
	if CLIENT then
		if StemControllerMenu.UpdateInfo then
			StemControllerMenu.UpdateInfo()
		end
		if StemControllerMenu.UpdateIntensityList then
			StemControllerMenu.UpdateIntensityList()
		end
		if IsValid( StemControllerMenu.setList ) then
			DebugPrint( "Reloading set list with sets:", tableConcat( tableGetKeys( musicSets ), ", " ) )
			StemControllerMenu.setList:Clear() -- Explicitly clear the list
			timer.Simple( 0.1, function()
				if IsValid( StemControllerMenu.setList ) then
					PopulateSetList()
					-- Select the current set in the UI
					for _, line in ipairs( StemControllerMenu.setList:GetLines() ) do
						if line.set == currentSet then
							StemControllerMenu.setList:SelectItem( line )
							break
						end
					end
					DebugPrint( "Set list repopulated with", #StemControllerMenu.setList:GetLines(), "lines" )
				end
			end )
		end
	end

	-- Determine the set to play
	local setToPlay = musicSets[ oldSet ] and oldSet or ( tableGetKeys( musicSets )[ 1 ] or "alc_vodka" )
	if setToPlay ~= oldSet and CLIENT then
		chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Previous set ", Color( 240, 200, 80 ), oldSet, Color( 255, 255, 255 ), " no longer exists, switching to ", Color( 240, 200, 80 ), setToPlay )
		surface.PlaySound( "ui/error.wav" )
	end

	-- Update currentSet and trigger set change
	currentSet = setToPlay
	if SERVER then
		net.Start( "StemController_SetSet" )
		net.WriteString( currentSet )
		net.Broadcast()
	end
	RunConsoleCommand( "StemController_setname", currentSet )
end

-- Client networking and UI
if CLIENT then
	-- Colors for stem buttons
	local STEM_ON_COLOR = Color( 75, 180, 70 )
	local STEM_OFF_COLOR = Color( 50, 50, 50 )
	local STEM_HOVER_ON_COLOR = Color( 50, 255, 50, 255 )
	local STEM_HOVER_OFF_COLOR = Color( 50, 105, 255, 100 )

	-- Utility: Create styled button
	local function CreateStyledButton( parent, x, y, w, h, text, cmd, isStem, stemIndex )
		local btn = vguiCreate( "DButton", parent )
		btn:SetPos( x, y )
		btn:SetSize( w, h )
		btn:SetText( text )
		btn:SetFont( "DermaDefault" )
		btn:SetTextColor( Color( 255, 255, 255 ) )
		btn.Paint = function( self, w, h )
			local bgColor = isStem and ( stemStates[ stemIndex ] and STEM_ON_COLOR or STEM_OFF_COLOR ) or
							( self:IsHovered() and Color( 100, 100, 100, 255 ) or Color( 60, 60, 60, 255 ) )
			if self:IsHovered() and isStem then
				bgColor = stemStates[ stemIndex ] and STEM_HOVER_ON_COLOR or STEM_HOVER_OFF_COLOR
			end
			draw.RoundedBox( 4, 0, 0, w, h, bgColor )
		end
		btn.DoClick = cmd
		return btn
	end

	list.Set( "DesktopWindows", "StemController", {
		title = "Stem Controller Menu",
		icon = "icon16/music.png",
		width = 150,
		height = 30,
		onewindow = true,
		init = function( icon, frame )
			if not musicSets or table.IsEmpty( musicSets ) then
				chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available, check music_data.lua" )
				surface.PlaySound( "ui/error.wav" )
				frame:Close() -- Close the frame if no music sets are available
				return
			end
			RunConsoleCommand( "StemController_menu" )
			frame:Close() -- Close the frame immediately after running the command
		end
	})

	list.Set( "DesktopWindows", "StemControllerstems", {
		title = "Stem Controller Stem Menu",
		icon = "icon16/application_view_list.png",
		width = 150,
		height = 30,
		onewindow = true,
		init = function( icon, frame )
			if not musicSets or table.IsEmpty( musicSets ) then
				chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available, check music_data.lua" )
				surface.PlaySound( "ui/error.wav" )
				frame:Close()
				return
			end
			RunConsoleCommand( "StemController_stemmenu" )
			frame:Close()
		end
	})

	net.Receive( "StemController_SetSet", function()
		local set = net.ReadString()
		cvMusicSet:SetString( set )
	end )

	net.Receive( "StemController_TriggerStem", function()
		local stem = net.ReadUInt( 4 )
		RunConsoleCommand( "StemController_triggerstem", stem )
	end )

	net.Receive( "StemController_TriggerIntensity", function()
		local intensity = net.ReadString()
		RunConsoleCommand( "StemController_triggerintensity", intensity )
	end )

	net.Receive( "StemController_Volume", function()
		local vol = net.ReadFloat()
		RunConsoleCommand( "StemController_volume", vol )
	end )

	net.Receive( "StemController_Stop", function()
		RunConsoleCommand( "StemController_stop" )
	end )

	net.Receive( "StemController_Randomize_Stems", function()
		RunConsoleCommand( "StemController_randomize_stems" )
	end )

	-- Initial setup
	hookAdd( "InitPostEntity", "StemController_Initial", function( )
		LoadMusicData( ) -- Load music data on client init
		if not musicSets or table.IsEmpty( musicSets ) then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available, check music_data.lua" )
			surface.PlaySound( "ui/error.wav" )
			return
		end
		timerSimple( 2, function( )
			if cvRandomSet:GetBool( ) then
				ChangeMusicSet( "random" )
			else
				-- Initialize the default set
				RunConsoleCommand( "StemController_setname", currentSet )
			end
		end )
	end )

	hook.Add( "HUDPaint", "StemController_DebugHUD", function( )
		if not cvDebug:GetBool( ) then return end

		local lines = { }
		local setName = musicSets[ currentSet ] and musicSets[ currentSet ].name or currentSet
		local activeStems = { }
		local stemCount = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
		for i = 1, stemCount do
			if stemStates[ i ] then
				table.insert( activeStems, i )
			end
		end
		table.insert( lines, "Set: " .. setName )
		table.insert( lines, "Active Stems: " .. ( next( activeStems ) and table.concat( activeStems, ", " ) or "None" ) )

		-- Handle intensity with flashing stars
		local intensityText = "Intensity: "
		if currentIntensity then
			intensityText = intensityText .. currentIntensity
			local stars = currentIntensity:gsub( "[^★]", "" ) -- Extract all ★ characters
			if stars and #stars > 0 then
				intensityText = "Intensity: " .. stars -- Use the full star sequence
			end
			table.insert( lines, intensityText )
			print( "Debug: currentIntensity =", currentIntensity, "Stars =", stars, "Star count =", #stars ) -- Debug output
			-- Add sequence number if intensity has multiple combinations
			if musicSets[ currentSet ] and musicSets[ currentSet ].intensity and musicSets[ currentSet ].intensity[ currentIntensity ] and type( musicSets[ currentSet ].intensity[ currentIntensity ][ 1 ] ) == "table" then
				local sequenceIndex = comboIndex[ currentSet ] and comboIndex[ currentSet ][ currentIntensity ] or 1
				table.insert( lines, "Sequence: " .. sequenceIndex )
			end
		else
			table.insert( lines, "Intensity: None" )
		end

		if cvRandomIntensity:GetBool( ) and musicSets[ currentSet ] and musicSets[ currentSet ].intensity and nextIntensityTime > 0 then
			local timeLeft = math.max( 0, math.floor( nextIntensityTime - CurTime( ) ) )
			table.insert( lines, "Next Intensity Cycle: " .. timeLeft .. "s" )
		end

		surface.SetFont( "DermaLarge" )
		local maxWidth = 0
		local heights = { }
		for i, line in ipairs( lines ) do
			local w, h = surface.GetTextSize( line )
			maxWidth = math.max( maxWidth, w )
			heights[ i ] = h
		end
		local totalHeight = #lines * 30 + 10
		local x = 25
		local y = ScrH( ) / 2 - totalHeight / 2

		-- Draw background box
		local boxWidth = math.min( maxWidth + 20, ScrW( ) - 20 )
		draw.RoundedBox( 8, x, y - 10, boxWidth, totalHeight + 20, Color( 0, 0, 0, 180 ) )

		-- Draw text with shadow and flashing stars
		for i, line in ipairs( lines ) do
			local textY = y + ( i - 1 ) * 30
			if line:find( "Intensity:" ) and currentIntensity and currentIntensity:gsub( "[^★]", "" ) ~= "" then
				local fullText = line
				local baseText = "Intensity: "
				local stars = currentIntensity:gsub( "[^★]", "" ) -- Get all ★ characters
				local fullWidth = surface.GetTextSize( fullText )
				local baseWidth = surface.GetTextSize( baseText )
				local starWidth = surface.GetTextSize( stars )
				-- Center the entire line
				local centerX = x + ( boxWidth / 2 )
				-- Draw base text
				draw.SimpleText( baseText, "DermaLarge", centerX - ( fullWidth / 2 ), textY + 2, Color( 0, 0, 0, 200 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
				draw.SimpleText( baseText, "DermaLarge", centerX - ( fullWidth / 2 ), textY, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
				-- Draw flashing stars, positioned after base text
				local time = CurTime( )
				local cycleSpeed = 2.5 -- Adjust for faster/slower flashing
				local phase = ( time * cycleSpeed ) % 3 -- Cycle through 0 to 3
				local r, b, w = 0, 0, 0

				-- Define color phases: 0-1 (Red), 1-2 (Blue), 2-3 (White)
				if phase < 1 then
					r = math.floor( 255 * ( 1 - phase ) ) -- Fade out red
				elseif phase < 2 then
					b = math.floor( 255 * ( phase - 1 ) ) -- Fade in blue
				else
					w = math.floor( 255 * ( phase - 2 ) ) -- Fade in white ( R=G=B for white )
				end

				-- Set flash color: white requires R, G, B all set to the same value
				local flashColor = Color(
					math.max( r, w ), -- Red or white contribution
					w,             -- Green for white
					math.max( b, w ), -- Blue or white contribution
					255
				)

				local starX = centerX - ( fullWidth / 2 ) + baseWidth
				draw.SimpleText( stars, "DermaLarge", starX, textY + 2, Color( 0, 0, 0, 200 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP ) -- Shadow
				draw.SimpleText( stars, "DermaLarge", starX, textY, flashColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP ) -- Stars
			else
				draw.SimpleText( line, "DermaLarge", x + ( boxWidth / 2 ), textY + 2, Color( 0, 0, 0, 200 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
				draw.SimpleText( line, "DermaLarge", x + ( boxWidth / 2 ), textY, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
			end
		end
	end )

	local function FormatVolume( vol )
		if math.abs( vol ) < 0.001 then return "0" end  -- Handle zero
		local rounded = math.Round( vol, 2 )  -- Round to 2 decimal places for precision
		if rounded == math.floor( rounded ) then return tostring( math.floor( rounded ) ) end  -- Whole number
		local singleDecimal = math.Round( rounded * 10 ) / 10  -- Check for single decimal
		if singleDecimal == rounded then return string.format( "%.1f", rounded ) end  -- Single decimal
		return string.format( "%.2f", rounded )  -- Two decimals
	end

	-- HUD visualization for stem volume fade progress
	hookAdd("HUDPaint", "StemController_VolumeVisualizer", function()
		if not cvDebug:GetBool() then return end
		local musicVolume = cvMusicVolume:GetFloat()
		if musicVolume <= 0 then return end  -- No visualization if volume is 0

		local fadeTime = cvFadeTime:GetFloat()
		local barWidth = 250
		local barHeight = 20
		local spacing = 10  -- Space between bars
		local startX = 50
		local startY = 650
		local padding = 10  -- Padding for shadow box

		-- Count active stems to determine shadow box size
		local activeStems = 0
		for stem, channel in pairs( currentStems ) do
			if IsValid( channel ) and stemVolumes[ stem ] then
				activeStems = activeStems + 1
			end
		end

		-- Draw shadow box if there are active stems
		if activeStems > 0 then
			local boxHeight = activeStems * barHeight + ( activeStems - 1 ) * spacing + 2 * padding
			surface.SetDrawColor( 0, 0, 0, 150 )  -- Semi-transparent black shadow box
			surface.DrawRect( startX - padding, startY - padding, barWidth + 2 * padding, boxHeight )
		end

		-- Draw progress bars
		for stem, channel in pairs( currentStems ) do
			if IsValid( channel ) and stemVolumes[ stem ] then
				local currentVol = stemVolumes[ stem ] or 0
				local baseMult = stemBaseVolumeMultipliers[ stem ] or 1
				local maxVol = musicVolume * baseMult  -- Maximum volume for this stem
				local progress = maxVol > 0 and math.Clamp( currentVol / maxVol, 0, 1 ) or 0

				-- Draw background bar
				surface.SetDrawColor( 50, 50, 50, 200 )  -- Dark gray background
				surface.DrawRect( startX, startY, barWidth, barHeight )

				-- Draw progress bar
				surface.SetDrawColor( 30, 150, 36 )  -- Green for progress
				surface.DrawRect( startX, startY, barWidth * progress, barHeight )

				-- Format volume using custom function
				local currentVolStr = FormatVolume( currentVol )
				local maxVolStr = FormatVolume( maxVol )

				-- Draw stem label with fade time
				surface.SetTextColor( 255, 255, 255, 255 )
				surface.SetFont( "DermaDefault" )
				surface.SetTextPos( startX + 5, startY + 2 )
				surface.DrawText( "Stem " .. stem .. " Volume: " .. currentVolStr .. " / " .. maxVolStr .. " | Fade: " .. string.format( "%.2f", fadeTime ) .. "s" )

				-- Move to next bar position
				startY = startY + barHeight + spacing
			end
		end
	end)
	-- Function to populate DListView
	local function PopulateSetList( )
		StemControllerMenu.setList:Clear( )
		local categories = { }
		local sortedSets = { }
		for set, data in pairs( musicSets ) do
			local game = data.gameOrigin or "Grand Theft Auto V"
			local category = data.category and data.category ~= "" and data.category or ""
			categories[ game ] = categories[ game ] or { }
			categories[ game ][ category ] = categories[ game ][ category ] or { }
			table.insert( categories[ game ][ category ], { set = set, name = data.name } )
			table.insert( sortedSets, { set = set, name = data.name, game = game, category = category } )
		end

		-- Sort sets by game, then category, then name
		table.sort( sortedSets, function( a, b )
			if a.game ~= b.game then
				return a.game < b.game
			elseif a.category ~= b.category then
				if a.category == "" then
					return true
				elseif b.category == "" then
					return false
				else
					return a.category < b.category
				end
			else
				return a.name < b.name
			end
		end )

		local addedGames = { }
		local addedCategories = { }
		local selectedLine = nil
		for _, entry in ipairs( sortedSets ) do
			if not addedGames[ entry.game ] then
				expandedCategories[ entry.game ] = expandedCategories[ entry.game ] or { }
				local header = StemControllerMenu.setList:AddLine( "" )
				header.IsHeader = true
				header.Paint = function( self, w, h )
					draw.RoundedBox( 4, 0, 0, w, h, Color( 50, 50, 50, 255 ) )
					draw.SimpleText( entry.game, "DermaDefaultBold", 5, h / 2, Color( 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				end
				header.Columns[ 1 ].Paint = function( ) end
				header.OnSelect = function( ) end
				addedGames[ entry.game ] = true
			end
			if entry.category ~= "" and not addedCategories[ entry.game .. "_" .. entry.category ] then
				if expandedCategories[ entry.game ][ entry.category ] == nil then
					expandedCategories[ entry.game ][ entry.category ] = false
				end
				local header = StemControllerMenu.setList:AddLine( "" )
				header.IsHeader = true
				header.IsCategory = true
				header.Game = entry.game
				header.Category = entry.category
				header.Paint = function( self, w, h )
					draw.RoundedBox( 4, 0, 0, w, h, Color( 60, 60, 60, 255 ) )
					local prefix = expandedCategories[ entry.game ][ entry.category ] and "- " or "+ "
					draw.SimpleText( prefix .. entry.category, "DermaDefaultBold", 5, h / 2, Color( 200, 200, 200 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
				end
				header.Columns[ 1 ].Paint = function( ) end
				header.OnMousePressed = function( self, code )
					if code == MOUSE_LEFT then
						expandedCategories[ entry.game ][ entry.category ] = not expandedCategories[ entry.game ][ entry.category ]
						local selectedSet = currentSet
						if IsValid( StemControllerMenu.setList ) then
							PopulateSetList( )
							for _, line in ipairs( StemControllerMenu.setList:GetLines( ) ) do
								if line.set == selectedSet then
									StemControllerMenu.setList:SelectItem( line )
									break
								end
							end
						end
					end
				end
				addedCategories[ entry.game .. "_" .. entry.category ] = true
			end
			if entry.category == "" or expandedCategories[ entry.game ][ entry.category ] then
				local indent = entry.category == "" and "  " or "    "
				local line = StemControllerMenu.setList:AddLine( indent .. entry.name )
				line.set = entry.set
				line.Paint = function( self, w, h )
					local bgColor = self:IsHovered( ) and Color( 100, 100, 100, 255 ) or ( self:IsSelected( ) and Color( 80, 80, 80, 255 ) or Color( 60, 60, 60, 255 ) )
					draw.RoundedBox( 4, 0, 0, w, h, bgColor )
				end
				line.Columns[ 1 ]:SetFont( "DermaDefault" )
				line.Columns[ 1 ]:SetColor( Color( 255, 255, 255 ) )
				if entry.set == currentSet then
					selectedLine = line
				end
			end
		end
		if selectedLine then
			StemControllerMenu.setList:SelectItem( selectedLine )
		end
	end

	concommandAdd( "StemController_menu", function( )
		if not musicSets or table.IsEmpty( musicSets ) then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available, check music_data.lua" )
			surface.PlaySound( "ui/error.wav" )
			return
		end

		local frame = vguiCreate( "DFrame" )
		frame:SetSize( 450, 710 )
		frame:Center( )
		frame:SetTitle( "Stem Controller Main Menu" )
		frame:SetDraggable( true )
		frame:ShowCloseButton( true )
		frame:MakePopup( )
		frame.Paint = function( self, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, Color( 25, 25, 25, 240 ) )
			draw.RoundedBox( 8, 0, 0, w, 25, Color( 45, 45, 45, 255 ) )
		end

		-- Music set selection
		local setLabel = vguiCreate( "DLabel", frame )
		setLabel:SetPos( 10, 30 )
		setLabel:SetText( "Select Music Set:" )
		setLabel:SetFont( "DermaDefaultBold" )
		setLabel:SetColor( Color( 255, 255, 255 ) )
		setLabel:SizeToContents( )

		StemControllerMenu.setList = vguiCreate( "DListView", frame )
		StemControllerMenu.setList:SetPos( 10, 50 )
		StemControllerMenu.setList:SetSize( 430, 150 )
		StemControllerMenu.setList:AddColumn( "Music Set" )
		StemControllerMenu.setList:SetMultiSelect( false )
		StemControllerMenu.setList.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 35, 35, 35, 255 ) )
		end
		StemControllerMenu.setList.VBar.Paint = function( ) end
		StemControllerMenu.setList.VBar.btnUp.Paint = function( ) end
		StemControllerMenu.setList.VBar.btnDown.Paint = function( ) end
		StemControllerMenu.setList.VBar.btnGrip.Paint = function( self, w, h )
			draw.RoundedBox( 4, 2, 0, w - 4, h, Color( 75, 75, 75, 255 ) )
		end
		StemControllerMenu.setList.OnRowSelected = function( _, _, row )
			if not row.IsHeader and row.set ~= currentSet then
				ChangeMusicSet( "next", row.set )
				--surface.PlaySound( "ui/blip.wav" )
			end
		end
		PopulateSetList( )

		-- Control buttons
		local buttonPanel = vguiCreate( "DPanel", frame )
		buttonPanel:SetPos( 10, 210 )
		buttonPanel:SetSize( 430, 70 )
		buttonPanel.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 35, 35, 35, 255 ) )
		end

		local function CreateStyledButton( parent, x, y, w, h, text, cmd )
			local btn = vguiCreate( "DButton", parent )
			btn:SetPos( x, y )
			btn:SetSize( w, h )
			btn:SetText( text )
			btn:SetFont( "DermaDefaultBold" )
			btn:SetTextColor( Color( 255, 255, 255 ) )
			btn.Paint = function( self, w, h )
				local bgColor = self:IsHovered( ) and Color( 85, 85, 85, 255 ) or Color( 55, 55, 55, 255 )
				draw.RoundedBox( 4, 0, 0, w, h, bgColor )
			end
			btn.DoClick = function( )
				cmd( )
				--surface.PlaySound( "ui/0x0E60F7B2.wav" )
			end
			return btn
		end
		CreateStyledButton( buttonPanel, 5, 5, 140, 30, "Random Set", function( ) ChangeMusicSet( "random" ) end )
		CreateStyledButton( buttonPanel, 150, 5, 140, 30, "Random in Cat.", function( ) ChangeMusicSet( "same_category" ) end )
		CreateStyledButton( buttonPanel, 295, 5, 135, 30, "Reload Data", function( ) frame:Close( ) RunConsoleCommand( "StemController_reload_data" ) RunConsoleCommand( "StemController_menu" ) end )
		CreateStyledButton( buttonPanel, 5, 35, 140, 30, "Stem Controller", function( ) frame:Close( ) RunConsoleCommand( "StemController_stemmenu" ) end )
		CreateStyledButton( buttonPanel, 150, 35, 140, 30, "Randomize Stems", function( ) RunConsoleCommand( "StemController_randomize_stems" ) end )
		CreateStyledButton( buttonPanel, 295, 35, 135, 30, "Stop Music", function( ) RunConsoleCommand( "StemController_stop" ) end )

		-- Settings panel
		local settingsPanel = vguiCreate( "DPanel", frame )
		settingsPanel:SetPos( 10, 290 )
		settingsPanel:SetSize( 430, 150 )
		settingsPanel.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 35, 35, 35, 255 ) )
		end

		local settingsLabel = vguiCreate( "DLabel", settingsPanel )
		settingsLabel:SetPos( 5, 5 )
		settingsLabel:SetText( "Settings:" )
		settingsLabel:SetFont( "DermaDefaultBold" )
		settingsLabel:SetColor( Color( 255, 255, 255 ) )
		settingsLabel:SizeToContents( )

		local volumeSlider = vguiCreate( "DNumSlider", settingsPanel )
		volumeSlider:SetPos( 5, 25 )
		volumeSlider:SetSize( 420, 20 )
		volumeSlider:SetText( "Volume" )
		volumeSlider:SetMin( 0 )
		volumeSlider:SetMax( 1 )
		volumeSlider:SetDecimals( 2 )
		volumeSlider:SetConVar( "StemController_volume" )
		volumeSlider:SetValue( cvMusicVolume:GetFloat( ) )

		local fadeSlider = vguiCreate( "DNumSlider", settingsPanel )
		fadeSlider:SetPos( 5, 50 )
		fadeSlider:SetSize( 420, 20 )
		fadeSlider:SetText( "Fade Time (s)" )
		fadeSlider:SetMin( 0 )
		fadeSlider:SetMax( 10 )
		fadeSlider:SetDecimals( 1 )
		fadeSlider:SetConVar( "StemController_fadetime" )
		fadeSlider:SetValue( cvFadeTime:GetFloat( ) )

		local playbackSlider = vguiCreate( "DNumSlider", settingsPanel )
		playbackSlider:SetPos( 5, 75 )
		playbackSlider:SetSize( 420, 20 )
		playbackSlider:SetText( "Playback Rate" )
		playbackSlider:SetMin( 0.5 )
		playbackSlider:SetMax( 2.0 )
		playbackSlider:SetDecimals( 2 )
		playbackSlider:SetConVar( "StemController_playbackrate" )
		playbackSlider:SetValue( cvPlaybackRate:GetFloat( ) )

		local randomSetCheck = vguiCreate( "DCheckBoxLabel", settingsPanel )
		randomSetCheck:SetPos( 5, 100 )
		randomSetCheck:SetText( "Random Set on Spawn" )
		randomSetCheck:SetFont( "DermaDefault" )
		randomSetCheck:SetTextColor( Color( 255, 255, 255 ) )
		randomSetCheck:SetConVar( "StemController_randomset" )
		randomSetCheck:SizeToContents( )

		local randomIntensityCheck = vguiCreate( "DCheckBoxLabel", settingsPanel )
		randomIntensityCheck:SetPos( 5, 125 )
		randomIntensityCheck:SetText( "Enable Intensity Changing Sequences" )
		randomIntensityCheck:SetFont( "DermaDefault" )
		randomIntensityCheck:SetTextColor( Color( 255, 255, 255 ) )
		randomIntensityCheck:SetConVar( "StemController_intensitysequences" )
		randomIntensityCheck:SizeToContents( )

		-- Info panel
		local infoPanel = vguiCreate( "DPanel", frame )
		infoPanel:SetPos( 10, 450 )
		infoPanel:SetSize( 430, 100 )
		infoPanel.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 35, 35, 35, 255 ) )
		end

		StemControllerMenu.infoLabel = vguiCreate( "DLabel", infoPanel )
		StemControllerMenu.infoLabel:SetPos( 5, 5 )
		StemControllerMenu.infoLabel:SetSize( 420, 90 )
		StemControllerMenu.infoLabel:SetWrap( true )
		StemControllerMenu.infoLabel:SetFont( "DermaDefault" )
		StemControllerMenu.infoLabel:SetColor( Color( 255, 255, 255 ) )

		function StemControllerMenu.UpdateInfo( )
			if not IsValid( StemControllerMenu.infoLabel ) then return end
			local data = musicSets[ currentSet ] or { name = currentSet or "None", gameOrigin = "Unknown", composer = "Unknown", category = "Unknown" }
			local intensities = musicSets[ currentSet ] and musicSets[ currentSet ].intensity or { }
			local intensityList = table.concat( table.GetKeys( intensities ), ", " )
			StemControllerMenu.infoLabel:SetText(
				"Track: " .. data.name ..
				"\nGame: " .. data.gameOrigin ..
				"\nCategory: " .. ( data.category or "Unknown" ) ..
				"\nComposer: " .. data.composer ..
				"\nIntensities: " .. ( intensityList ~= "" and intensityList or "None" )
			)
		end
		StemControllerMenu.UpdateInfo( )

		-- Intensity selection
		local intensityLabel = vguiCreate( "DLabel", frame )
		intensityLabel:SetPos( 10, 560 )
		intensityLabel:SetText( "Select Intensity:" )
		intensityLabel:SetFont( "DermaDefaultBold" )
		intensityLabel:SetColor( Color( 255, 255, 255 ) )
		intensityLabel:SizeToContents( )

		StemControllerMenu.intensityPanel = vguiCreate( "DScrollPanel", frame )
		StemControllerMenu.intensityPanel:SetPos( 10, 580 )
		StemControllerMenu.intensityPanel:SetSize( 430, 120 )
		StemControllerMenu.intensityPanel.Paint = function( self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, Color( 35, 35, 35, 255 ) )
		end
		local scrollBar = StemControllerMenu.intensityPanel:GetVBar( )
		scrollBar.Paint = function( ) end
		scrollBar.btnUp.Paint = function( ) end
		scrollBar.btnDown.Paint = function( ) end
		scrollBar.btnGrip.Paint = function( self, w, h )
			draw.RoundedBox( 4, 2, 0, w - 4, h, Color( 75, 75, 75, 255 ) )
		end

		StemControllerMenu.intensityButtons = { }
		function StemControllerMenu.UpdateIntensityList( )
			if not IsValid( StemControllerMenu.intensityPanel ) then return end
			for _, btn in pairs( StemControllerMenu.intensityButtons ) do
				if IsValid( btn ) then btn:Remove( ) end
			end
			StemControllerMenu.intensityButtons = { }
			if musicSets[ currentSet ] and musicSets[ currentSet ].intensity then
				-- Define the fixed order for standard intensities
				local fixedOrder = { "low", "medium", "high", "extreme" }
				local sortedIntensities = { }
				-- Add standard intensities in fixed order if they exist
				for _, intensity in ipairs( fixedOrder ) do
					if musicSets[ currentSet ].intensity[ intensity ] then
						table.insert( sortedIntensities, intensity )
					end
				end
				-- Add custom intensities alphabetically
				local customIntensities = { }
				for intensity in pairs( musicSets[ currentSet ].intensity ) do
					if not table.HasValue( fixedOrder, intensity ) then
						table.insert( customIntensities, intensity )
					end
				end
				table.sort( customIntensities )
				for _, intensity in ipairs( customIntensities ) do
					table.insert( sortedIntensities, intensity )
				end
				local numIntensities = #sortedIntensities
				local maxButtonsPerRow = math.min( 4, math.max( 2, math.floor( 430 / 100 ) ) )
				local buttonsPerRow = math.min( maxButtonsPerRow, numIntensities )
				local buttonWidth = math.floor( 430 / buttonsPerRow ) - 10
				local buttonHeight = 30
				local rows = math.ceil( numIntensities / buttonsPerRow )

				local yPos = 5
				for i, intensity in ipairs( sortedIntensities ) do
					local row = math.floor( ( i - 1 ) / buttonsPerRow )
					local col = ( i - 1 ) % buttonsPerRow
					local xPos = 5 + col * ( buttonWidth + 5 )
					StemControllerMenu.intensityButtons[ #StemControllerMenu.intensityButtons + 1 ] = CreateStyledButton(
						StemControllerMenu.intensityPanel, xPos, yPos + row * ( buttonHeight + 5 ), buttonWidth, buttonHeight, intensity,
						function( ) RunConsoleCommand( "StemController_triggerintensity", intensity ) end
					)
				end
				StemControllerMenu.intensityPanel:GetCanvas( ):SetTall( yPos + rows * ( buttonHeight + 5 ) + 5 )
			end
			if IsValid( StemControllerMenu.infoLabel ) then
				StemControllerMenu.UpdateInfo( )
			end
		end
		StemControllerMenu.UpdateIntensityList( )
	end )

	-- Stem control menu
	concommandAdd( "StemController_stemmenu", function()
		if not musicSets or table.IsEmpty( musicSets ) then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available, check music_data.lua" )
			surface.PlaySound( "ui/error.wav" )
			return
		end
		local stemCount = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
		local frameHeight = mathMax( 350, 175 + ( stemCount * 35 ) )

		local frame = vguiCreate( "DFrame" )
		frame:SetSize( 350, frameHeight )
		frame:Center()
		frame:SetTitle( "Stem Menu" )
		frame:SetDraggable( true )
		frame:ShowCloseButton( true )
		frame:MakePopup()
		frame.Paint = function( self, w, h )
			draw.RoundedBox( 8, 0, 0, w, h, Color( 30, 30, 30, 240 ) )
			draw.RoundedBox( 8, 0, 0, w, 25, Color( 50, 50, 50, 255 ) )
		end

		frame.OnClose = function()
			hookRemove( "Think", "StemController_UpdateStemButtonColors" )
		end

		local stemLabel = vguiCreate( "DLabel", frame )
		stemLabel:SetPos( 10, 30 )
		stemLabel:SetText( "Toggle Stems for " .. ( musicSets[ currentSet ] and musicSets[ currentSet ].name or currentSet ) .. ":" )
		stemLabel:SetFont( "DermaDefaultBold" )
		stemLabel:SetColor( Color( 255, 255, 255 ) )
		stemLabel:SizeToContents()

		local stemButtons = {}
		local function UpdateStemButtons()
			for _, btn in pairs( stemButtons ) do
				if IsValid( btn ) then btn:Remove() end
			end
			stemButtons = {}
			local stemCount = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
			local yPos = 50
			for i = 1, stemCount do
				stemButtons[ i ] = CreateStyledButton( frame, 10, yPos, 330, 30, "Stem " .. i,
					function() RunConsoleCommand( "StemController_triggerstem", i ) end, true, i )
				yPos = yPos + 35
			end

			CreateStyledButton( frame, 10, yPos + 15, 330, 30, "Clear Stems", function() RunConsoleCommand( "StemController_stop" ) end )
			CreateStyledButton( frame, 10, yPos + 50, 330, 30, "Randomize Stems (2-4)", function() RunConsoleCommand( "StemController_randomize_stems" ) end )
			CreateStyledButton( frame, 10, yPos + 85, 330, 30, "Go Back to Score Menu", function()
				frame:Close()
				RunConsoleCommand( "StemController_menu" )
			end )
		end
		UpdateStemButtons()

		hookAdd( "OnConVarChanged", "StemController_UpdateStemButtons", function( name, _, newVal )
			if name == "StemController_setname" then
				if IsValid( stemLabel ) then
					stemLabel:SetText( "Toggle Stems for " .. ( musicSets[ currentSet ] and musicSets[ currentSet ].name or currentSet ) .. ":" )
					stemLabel:SizeToContents()
				end
				if IsValid( frame ) then
					local newStemCount = musicSets[ newVal ] and #musicSets[ newVal ].stems or MAX_STEMS
					local newHeight = mathMax( 350, 175 + ( newStemCount * 35 ) )
					frame:SetSize( 350, newHeight )
					frame:Center()
					UpdateStemButtons()
				end
			end
		end )

		hookAdd( "Think", "StemController_UpdateStemButtonColors", function()
			if not IsValid( frame ) then
				hookRemove( "Think", "StemController_UpdateStemButtonColors" )
				return
			end
			for i, btn in ipairs( stemButtons ) do
				if IsValid( btn ) then
					btn.Paint = function( self, w, h )
						local bgColor = stemStates[ i ] and STEM_ON_COLOR or STEM_OFF_COLOR
						if self:IsHovered() then
							bgColor = stemStates[ i ] and STEM_HOVER_ON_COLOR or STEM_HOVER_OFF_COLOR
						end
						draw.RoundedBox( 4, 0, 0, w, h, bgColor )
					end
				end
			end
		end )
	end )
end

-- Convar callbacks
cvarsAddChangeCallback( "StemController_volume", function( _, _, newVal )
	local vol = tonumber( newVal ) or 0.6
	for stem, active in pairs( stemStates ) do
		if active then
			FadeStem( stem, vol )
		end
	end
	if SERVER then
		net.Start( "StemController_Volume" )
		net.WriteFloat( vol )
		net.Broadcast()
	end
end )

cvarsAddChangeCallback( "StemController_setname", function( _, _, newVal )
	local set = newVal or "alc_vodka"
	if not musicSets or table.IsEmpty( musicSets ) then
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: No music sets available" )
			surface.PlaySound( "ui/error.wav" )
		end
		DebugPrint( "Error: No music sets available in musicSets" )
		isChangingSet = false
		return
	end
	if not musicSets[ set ] then
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Error: Invalid music set:", Color( 240, 200, 80 ), set )
			surface.PlaySound( "ui/error.wav" )
		end
		DebugPrint( "Invalid set selected:", set )
		isChangingSet = false
		return
	end

	-- Store the user's current fade time and set to 1 second for set change
	local originalFadeTime = cvFadeTime:GetFloat()
	RunConsoleCommand( "StemController_fadetime", "1" )

	timerSimple( 0.1, function()
		RunConsoleCommand( "StemController_stop" )
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Stopping Stems. Do not trigger any stems until next track is loaded!" )
			surface.PlaySound( "ui/blip.wav" )
		end
	end )

	timerSimple( 1.0, function()  -- Use fixed 1-second delay to match temporary fade time
		currentSet = set
		if PrecacheStems( set ) then
			StartStems( set )
		end
		-- Restore the user's original fade time
		RunConsoleCommand( "StemController_fadetime", tostring( originalFadeTime ) )
		if CLIENT then
			chat.AddText( Color( 93, 182, 229 ), "[StemController] ", Color( 255, 255, 255 ), "Music Set ", Color( 240, 200, 80 ), set, Color( 255, 255, 255 ), " is loaded" )
			surface.PlaySound( "ui/0x0E60F7B2.wav" )
			if StemControllerMenu.UpdateInfo then
				StemControllerMenu.UpdateInfo()
			end
			if IsValid( StemControllerMenu.setList ) then
				for _, line in ipairs( StemControllerMenu.setList:GetLines() ) do
					if line.set == set then
						StemControllerMenu.setList:SelectItem( line )
						break
					end
				end
			end
			if StemControllerMenu.UpdateIntensityList then
				StemControllerMenu.UpdateIntensityList()
			end
		end
		DebugPrint( "Switched to set:", set )
		if SERVER then
			net.Start( "StemController_SetSet" )
			net.WriteString( set )
			net.Broadcast()
		end
		isChangingSet = false
	end )
end )

cvarsAddChangeCallback( "StemController_randomize_intensity", function( _, _, newVal )
	if tonumber( newVal ) == 1 and currentIntensity and musicSets[ currentSet ] and musicSets[ currentSet ].intensity then
		local interval = mathRandom( 30, 45 )
		nextIntensityTime = CurTime() + interval
		timerCreate( "StemController_Randomize_Intensity", interval, 0, function()
			if currentIntensity and musicSets[ currentSet ] and musicSets[ currentSet ].intensity and musicSets[ currentSet ].intensity[ currentIntensity ] then
				TriggerIntensity( currentIntensity )
			end
		end )
	else
		timerRemove( "StemController_Randomize_Intensity" )
		nextIntensityTime = 0
	end
end )

-- Console commands
concommandAdd( "StemController_triggerstem", function( ply, _, args )
	local stem = tonumber( args[ 1 ] )
	local maxStems = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
	if not stem or stem < 1 or stem > maxStems then
		if IsValid( ply ) then
			ply:PrintMessage( HUD_PRINTTALK, "[StemController] Invalid stem number (1-" .. maxStems .. ")" )
		end
		return
	end
	TriggerStem( stem )
	if SERVER then
		net.Start( "StemController_TriggerStem" )
		net.WriteUInt( stem, 4 )
		net.Broadcast()
	end
end )

concommandAdd( "StemController_triggerintensity", function( ply, _, args )
	local intensity = args[ 1 ] and args[ 1 ]:lower()
	local validIntensities = musicSets[ currentSet ] and musicSets[ currentSet ].intensity or {}
	if not intensity or not validIntensities[ intensity ] then
		if IsValid( ply ) then
			local intensityList = tableConcat( tableGetKeys( validIntensities ), ", " )
			ply:PrintMessage( HUD_PRINTTALK, "[StemController] Invalid intensity (valid: " .. ( intensityList ~= "" and intensityList or "none" ) .. ")" )
		end
		return
	end
	TriggerIntensity( intensity )
	if SERVER then
		net.Start( "StemController_TriggerIntensity" )
		net.WriteString( intensity )
		net.Broadcast()
	end
end )

concommandAdd( "StemController_stop", function( ply )
	local anyActive = false
	local maxStems = musicSets[ currentSet ] and #musicSets[ currentSet ].stems or MAX_STEMS
	for i = 1, maxStems do
		if stemStates[ i ] then
			anyActive = true
			TriggerStem( i )
		end
	end
	if anyActive then
		DebugPrint( "Stopped all active stems" )
	else
		DebugPrint( "No active stems to stop" )
	end
	currentIntensity = nil
	timerRemove( "StemController_Randomize_Intensity" )
	nextIntensityTime = 0
	if SERVER then
		net.Start( "StemController_Stop" )
		net.Broadcast()
	end
end )

concommandAdd( "StemController_randomize_stems", function( ply )
	RandomizeStems()
	if SERVER then
		net.Start( "StemController_Randomize_Stems" )
		net.Broadcast()
	end
--	if IsValid( ply ) then
--		ply:PrintMessage( HUD_PRINTTALK, "[StemController] Randomized stems (2-4)" )
--	end
end )

concommandAdd( "StemController_randomize_musicset", function( ply )
	ChangeMusicSet( "random" )
	if SERVER and IsValid( ply ) then
		ply:PrintMessage( HUD_PRINTTALK, "[StemController] Randomized music set" )
	end
end )

concommandAdd( "StemController_reload_data", function( ply )
	ReloadMusicData()
	if SERVER and IsValid( ply ) then
		ply:PrintMessage( HUD_PRINTTALK, "[StemController] Music data reload triggered" )
	end
end )
