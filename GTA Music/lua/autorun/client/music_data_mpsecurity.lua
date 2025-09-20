local musicSets = {

	alc_electrocutioners = {
		name = "ALC Electrocutioners",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/alc_electrocutioners",
		stems = {
			"alc_electrocutioners_1.mp3",
			"alc_electrocutioners_2.mp3",
			"alc_electrocutioners_3.mp3",
			"alc_electrocutioners_4.mp3",
			"alc_electrocutioners_5.mp3",
			"alc_electrocutioners_6.mp3",
			"alc_electrocutioners_7.mp3",
			"alc_electrocutioners_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6 }, { 1, 2, 6, 8 }, { 1, 2, 4, 6 } },
			high = { { 1, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 6 }, { 1, 2, 4, 6, 7 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 4, 6, 7, 8 } },
			cooldown = { 2, 6 }
		}
	},

	alc_mission_eight = {
		name = "ALC Mission Eight",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/alc_mission_eight",
		stems = {
			"alc_mission_eight_1.mp3",
			"alc_mission_eight_2.mp3",
			"alc_mission_eight_3.mp3",
			"alc_mission_eight_4.mp3",
			"alc_mission_eight_5.mp3",
			"alc_mission_eight_6.mp3",
			"alc_mission_eight_7.mp3",
			"alc_mission_eight_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 2, 3 }, { 2 } },
			medium = { { 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 1, 2, 3, 5, 6 }, { 1, 2, 4, 6 } },
			high = { { 2, 3, 4, 5, 6, 7 }, { 1, 2, 4, 6, 7 }, { 2, 3, 4, 6 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 1, 2, 4, 6, 7, 8 } },
			cooldown = { 1, 6 }
		}
	},

	alc_no_no = {
		name = "ALC No No",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/alc_no_no",
		stems = {
			"alc_no_no_1.mp3",
			"alc_no_no_2.mp3",
			"alc_no_no_3.mp3",
			"alc_no_no_4.mp3",
			"alc_no_no_5.mp3",
			"alc_no_no_6.mp3",
			"alc_no_no_7.mp3",
			"alc_no_no_8.mp3"
		},
		intensity = {
			low = { { 1, 3 }, { 1, 3, 8 }, { 1, 8 } },
			medium = { { 1, 3, 4 }, { 1, 3, 4, 5 }, { 1, 4, 8 } },
			high = { { 1, 3, 4, 7 }, { 1, 3, 4, 5, 7 }, { 1, 4, 7, 8 } },
			extreme = { { 1, 3, 4, 5, 7, 8 }, { 1, 3, 4, 7, 8 }, { 1, 4, 5, 7 } },
			cooldown = { 4, 6 }
		}
	},

	dlc_security_back_home = {
		name = "DLC Security Back Home",
		gameOrigin = "GTA: Online",
		composer = "DāM-FunK",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/dlc_security_back_home",
		stems = {
			"dlc_security_back_home_1.mp3",
			"dlc_security_back_home_2.mp3",
			"dlc_security_back_home_3.mp3",
			"dlc_security_back_home_4.mp3",
			"dlc_security_back_home_5.mp3",
			"dlc_security_back_home_6.mp3",
			"dlc_security_back_home_7.mp3",
			"dlc_security_back_home_8.mp3",
		},
		stemVolumeAdjustment = {
			[ 4 ] = -10,  -- STEM 4: -10 dB quieter
		},
		intensity = {
			low = { { 1, 2, 3, 5 }, { 1, 3 }, { 1, 4 } },
			medium = { { 1, 3, 4, 5, 6 }, { 1, 2, 3, 4, 6 } },
			high = { { 1, 3, 7 }, { 1, 3, 4, 5, 7 }, { 2, 3, 6, 7 } },
			extreme = { { 1, 3, 4, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7, 8 }, { 1, 2, 6, 7, 8 } },
			cooldown = { 2, 6 }
		}
	},

	dlc_security_kill_dat = {
		name = "DLC Security Kill Dat",
		gameOrigin = "GTA: Online",
		composer = "DāM-FunK",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/dlc_security_kill_dat",
		stems = {
			"dlc_security_kill_dat_1.mp3",
			"dlc_security_kill_dat_2.mp3",
			"dlc_security_kill_dat_3.mp3",
			"dlc_security_kill_dat_4.mp3",
			"dlc_security_kill_dat_5.mp3",
			"dlc_security_kill_dat_6.mp3",
			"dlc_security_kill_dat_7.mp3",
			"dlc_security_kill_dat_8.mp3",
		},
		stemVolumeAdjustment = {
			[ 1 ] = -3,  -- STEM 1: -3 dB quieter
			[ 2 ] = -5,  -- STEM 2: -5 dB quieter
		},
		intensity = {
			low = { { 1, 3, 5 }, { 1, 3 }, { 1, 4 } },
			medium = { { 3, 4, 5, 6 }, { 3, 4, 6 } },
			high = { { 3, 4, 5, 6, 7 }, { 3, 4, 6, 7 }, { 1, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 6, 7, 8 }, { 3, 4, 5, 6, 7 } },
			cooldown = { 4, 6 }
		}
	},

	dlc_security_mass = {
		name = "DLC Security Mass",
		gameOrigin = "GTA: Online",
		composer = "DāM-FunK",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/dlc_security_mass",
		stems = {
			"dlc_security_mass_1.mp3",
			"dlc_security_mass_2.mp3",
			"dlc_security_mass_3.mp3",
			"dlc_security_mass_4.mp3",
			"dlc_security_mass_5.mp3",
			"dlc_security_mass_6.mp3",
			"dlc_security_mass_7.mp3",
			"dlc_security_mass_8.mp3",
		},
		stemVolumeAdjustment = {
			[ 5 ] = -4,  -- STEM 5: -4 dB quieter
		},
		intensity = {
			low = { { 1, 2, 3, 5 }, { 1, 3 }, { 1, 4 } },
			medium = { { 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			high = { { 1, 3, 7 }, { 1, 3, 4, 5, 7 }, { 2, 3, 6, 7 }, { 2, 3, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 6, 7, 8 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 6, 7, 8 } },
			hitman = { { 1, 5 }, { 1, 4 }, { 1, 3 } },
			cooldown = { 2, 6 }
		}
	},

	dlc_security_space = {
		name = "DLC Security Space",
		gameOrigin = "GTA: Online",
		composer = "DāM-FunK",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/dlc_security_space",
		stems = {
			"dlc_security_space_1.mp3",
			"dlc_security_space_2.mp3",
			"dlc_security_space_3.mp3",
			"dlc_security_space_4.mp3",
			"dlc_security_space_5.mp3",
			"dlc_security_space_6.mp3",
			"dlc_security_space_7.mp3",
			"dlc_security_space_8.mp3",
		},
		intensity = {
			low = { { 1, 3, 5 }, { 1, 3 }, { 1, 4 } },
			medium = { { 1, 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			high = { { 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7 }, { 1, 2, 4, 6, 7 } },
			extreme = { { 3, 4, 6, 7, 8 }, { 3, 4, 5, 6, 7 } },
			cooldown = { 2, 4, 6 }
		}
	},

	dlc_security_vibed = {
		name = "DLC Security Vibed",
		gameOrigin = "GTA: Online",
		composer = "DāM-FunK",
		category = "The Contracts Update",
		path = "gta5/mpsecurity/dlc_security_vibed",
		stems = {
			"dlc_security_vibed_1.mp3",
			"dlc_security_vibed_2.mp3",
			"dlc_security_vibed_3.mp3",
			"dlc_security_vibed_4.mp3",
			"dlc_security_vibed_5.mp3",
			"dlc_security_vibed_6.mp3",
			"dlc_security_vibed_7.mp3",
			"dlc_security_vibed_8.mp3",
		},
		intensity = {
			low = { { 1, 2, 3, 5 }, { 1, 3 }, { 1, 4 } },
			medium = { { 1, 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			high = { { 1, 3, 4, 5, 7 }, { 1, 3, 4, 6, 7 }, { 1, 4, 6, 7 } },
			extreme = { { 3, 4, 6, 7, 8 }, { 3, 4, 5, 6, 7 } },
			cooldown = { 4, 6 }
		}
	},
}

return musicSets