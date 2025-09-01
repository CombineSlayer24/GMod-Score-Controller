local musicSets = {
	nrt1 = {
		name = "NRT1",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt1/",
		stems = {
			"NRT_SONG_01_1.mp3",
			"NRT_SONG_01_2.mp3",
			"NRT_SONG_01_3.mp3",
			"NRT_SONG_01_4.mp3",
			"NRT_SONG_01_5.mp3",
			"NRT_SONG_01_6.mp3",
			"NRT_SONG_01_7.mp3",
			"NRT_SONG_01_8.mp3"
		},
	},
	nrt2 = {
		name = "NRT2",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt2/",
		stems = {
			-- Editor's note, 2 stems are
			-- missing here. The two missing
			-- stems here have been reused
			-- from NRT5. (Stem 3 and 5)
			"NRT_SONG_02_1.mp3",
			"NRT_SONG_02_2.mp3",
			"NRT_SONG_02_3.mp3",
			"NRT_SONG_02_4.mp3",
			"NRT_SONG_02_5.mp3",
			"NRT_SONG_02_6.mp3",
			"NRT_SONG_02_7.mp3",
			"NRT_SONG_02_8.mp3",
		},
	},
	nrt3 = {
		name = "NRT3",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt3/",
		stems = {
			"NRT_SONG_03_1.mp3",
			"NRT_SONG_03_2.mp3",
			"NRT_SONG_03_3.mp3",
			"NRT_SONG_03_4.mp3",
			"NRT_SONG_03_5.mp3",
			"NRT_SONG_03_6.mp3",
			"NRT_SONG_03_7.mp3",
			"NRT_SONG_03_8.mp3"
		},
	},
	nrt4 = {
		name = "NRT4",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt4/",
		stems = {
			"NRT_SONG_04_1.mp3",
			"NRT_SONG_04_2.mp3",
			"NRT_SONG_04_3.mp3",
			"NRT_SONG_04_4.mp3",
			"NRT_SONG_04_5.mp3",
			"NRT_SONG_04_6.mp3",
			"NRT_SONG_04_7.mp3",
			"NRT_SONG_04_8.mp3"
		},

		intensity = {
			low = { { 1, 2 }, { 2 } },
			medium = { { 1, 2, 3 }, { 1, 2, 3, 4 }, { 1, 2, 3, 7 }, { 1, 2, 3, 4, 7 } },
			high = { { 8 }, { 6, 8 }, { 3, 6, 8 } },
			wanted = { { 8 }, { 5, 7 } },
			evasion = { { 1, 2, 3 }, { 1, 3 } }
		}
	},
	nrt5 = {
		name = "NRT5",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt5/",
		stems = {
			"NRT_SONG_05_1.mp3",
			"NRT_SONG_05_2.mp3",
			"NRT_SONG_05_3.mp3",
			"NRT_SONG_05_4.mp3",
			"NRT_SONG_05_5.mp3",
			"NRT_SONG_05_6.mp3",
			"NRT_SONG_05_7.mp3",
			"NRT_SONG_05_8.mp3"
		},
	},
	nrt6 = {
		name = "NRT6",
		gameOrigin = "Red Dead Redemption",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/nrt6/",
		stems = {
			"NRT_SONG_06_1.mp3",
			"NRT_SONG_06_2.mp3",
			"NRT_SONG_06_3.mp3",
			"NRT_SONG_06_4.mp3",
			"NRT_SONG_06_5.mp3",
			"NRT_SONG_06_6.mp3",
			"NRT_SONG_06_7.mp3",
			"NRT_SONG_06_8.mp3"
		},
	},

	zmb_nrt_song_01 = {
		name = "ZMB NRT 1",
		gameOrigin = "Red Dead Redemption: Undead Nightmares",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/dlc6/zmb_nrt_song_01",
		stems = {
			"ZMB_NRT_SONG_01_1.mp3",
			"ZMB_NRT_SONG_01_2.mp3",
			"ZMB_NRT_SONG_01_3.mp3",
			"ZMB_NRT_SONG_01_4.mp3",
			"ZMB_NRT_SONG_01_5.mp3",
			"ZMB_NRT_SONG_01_7.mp3",
			"ZMB_NRT_SONG_01_8.mp3"
		},
	},

	tc_nrt_song_01 = {
		name = "TC NRT 1",
		gameOrigin = "Red Dead Redemption: Undead Nightmares",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/dlc6/TC_NRT_SONG_01",
		stems = {
			"TC_NRT_SONG_01_1.mp3",
			"TC_NRT_SONG_01_2.mp3",
			"TC_NRT_SONG_01_3.mp3",
			"TC_NRT_SONG_01_4.mp3",
			"TC_NRT_SONG_01_5.mp3",
		},
	},

	tc_nrt_song_02 = {
		name = "TC NRT 2",
		gameOrigin = "Red Dead Redemption: Undead Nightmares",
		composer = "Bill Elm, Woody Jackson",
		category = "Northern",
		path = "rdr1/dlc6/TC_NRT_SONG_02",
		stems = {
			"TC_NRT_SONG_02_1.mp3",
			"TC_NRT_SONG_02_2.mp3",
			"TC_NRT_SONG_02_3.mp3",
			"TC_NRT_SONG_02_4.mp3",
			"TC_NRT_SONG_02_5.mp3",
		},
	},
}

return musicSets