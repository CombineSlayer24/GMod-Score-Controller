local musicSets = {

	hei4_fin_a03 = {
		name = "Finale Track A03",
		gameOrigin = "GTA: Online",
		composer = "Adam Port",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_fin_track_a03",
		stems = {
			"HEI4_FIN_TRACK_A03_1.mp3",
			"HEI4_FIN_TRACK_A03_2.mp3",
			"HEI4_FIN_TRACK_A03_3.mp3",
			"HEI4_FIN_TRACK_A03_4.mp3",
			"HEI4_FIN_TRACK_A03_5.mp3",
			"HEI4_FIN_TRACK_A03_6.mp3",
			"HEI4_FIN_TRACK_A03_7.mp3",
			"HEI4_FIN_TRACK_A03_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 2 } },
			low_water = { { 1, 2, 4 }, { 1, 2, 3, 4 }, { 1, 2 } },
			medium = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 8 }, { 2, 5, 8 } },
			high = { { 2, 4, 7, 8 }, { 2, 3, 4, 5, 7, 8 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 4, 5, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 2, 4, 5, 6, 7, 8 }, { 2, 3, 4, 5, 7, 8 } },
			cooldown = { 2, 5 }
		}
	},

	hei4_fin_m05 = {
		name = "Finale Track M05",
		gameOrigin = "GTA: Online",
		composer = "&ME",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_fin_track_m05",
		stems = {
			"HEI4_FIN_TRACK_M05_1.mp3",
			"HEI4_FIN_TRACK_M05_2.mp3",
			"HEI4_FIN_TRACK_M05_3.mp3",
			"HEI4_FIN_TRACK_M05_4.mp3",
			"HEI4_FIN_TRACK_M05_5.mp3",
			"HEI4_FIN_TRACK_M05_6.mp3",
			"HEI4_FIN_TRACK_M05_7.mp3",
			"HEI4_FIN_TRACK_M05_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1 } },
			low_water = { { 1, 2, 4 }, { 1, 2, 3, 4 }, { 1, 2 } },
			medium = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 8 }, { 2, 5, 8 } },
			high = { { 2, 4, 8 }, { 2, 3, 4, 5, 7, 8 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 4, 5, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 5, 8 }, { 2, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 4 }
		}
	},

	hei4_fin_r08 = {
		name = "Finale Track R08",
		gameOrigin = "GTA: Online",
		composer = "Rampa",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_fin_track_r08",
		stems = {
			"HEI4_FIN_TRACK_R08_1.mp3",
			"HEI4_FIN_TRACK_R08_2.mp3",
			"HEI4_FIN_TRACK_R08_3.mp3",
			"HEI4_FIN_TRACK_R08_4.mp3",
			"HEI4_FIN_TRACK_R08_5.mp3",
			"HEI4_FIN_TRACK_R08_6.mp3",
			"HEI4_FIN_TRACK_R08_7.mp3",
			"HEI4_FIN_TRACK_R08_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1 } },
			low_water = { { 1, 2, 4 }, { 1, 2, 3, 4 }, { 1, 2 } },
			medium = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 8 }, { 2, 4, 5, 8 } },
			high = { { 2, 4, 7, 8 }, { 2, 3, 4, 5, 7, 8 }, { 2, 3, 4, 5, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 5, 6, 8 }, { 2, 3, 4, 5, 7, 8 } },
			cooldown = { 4, 8 }
		}
	},

	hei4_prep_track_a02 = {
		name = "Prep Track A02",
		gameOrigin = "GTA: Online",
		composer = "Adam Port",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_a02",
		stems = {
			"HEI4_PREP_TRACK_A02_1.mp3",
			"HEI4_PREP_TRACK_A02_2.mp3",
			"HEI4_PREP_TRACK_A02_3.mp3",
			"HEI4_PREP_TRACK_A02_4.mp3",
			"HEI4_PREP_TRACK_A02_5.mp3",
			"HEI4_PREP_TRACK_A02_6.mp3",
			"HEI4_PREP_TRACK_A02_7.mp3",
			"HEI4_PREP_TRACK_A02_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 4, 5, 6 }, { 1, 2, 3, 4, 5, 6 }, { 1, 2, 4, 5, 7, 8 } },
			high = { { 1, 2, 4, 6, 7, 8 }, { 1, 2, 3, 4, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7, 8 } },
			cooldown = { 4, 5 }
		}
	},

	hei4_prep_track_a04 = {
		name = "Prep Track A04",
		gameOrigin = "GTA: Online",
		composer = "Adam Port",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_a04",
		stems = {
			"HEI4_PREP_TRACK_A04_1.mp3",
			"HEI4_PREP_TRACK_A04_2.mp3",
			"HEI4_PREP_TRACK_A04_3.mp3",
			"HEI4_PREP_TRACK_A04_4.mp3",
			"HEI4_PREP_TRACK_A04_5.mp3",
			"HEI4_PREP_TRACK_A04_6.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 2, 3, 5 } },
			medium = { { 2, 3, 4, 5 }, { 1, 2, 3, 4 }, { 1, 5, 6 } },
			high = { { 2, 3, 5, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			extreme = { { 2, 3, 4, 5, 6 }, { 1, 2, 3, 4, 5, 6 } },
			cooldown = { 2, 5 }
		}
	},

	hei4_prep_m02 = {
		name = "Prep Track M02",
		gameOrigin = "GTA: Online",
		composer = "&ME",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_m02",
		stems = {
			"HEI4_PREP_M02_1.mp3",
			"HEI4_PREP_M02_2.mp3",
			"HEI4_PREP_M02_3.mp3",
			"HEI4_PREP_M02_4.mp3",
			"HEI4_PREP_M02_5.mp3",
			"HEI4_PREP_M02_6.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 2, 3, 4, 5 }, { 1, 2, 3, 4 }, { 1, 3 } },
			high = { { 2, 3, 5, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			extreme = { { 2, 3, 4, 5, 6 }, { 1, 2, 3, 4, 5, 6 } },
			cooldown = { 2, 3 }
		}
	},

	hei4_prep_m04 = {
		name = "Prep Track M04",
		gameOrigin = "GTA: Online",
		composer = "&ME",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_m04",
		stems = {
			"HEI4_PREP_M04_1.mp3",
			"HEI4_PREP_M04_2.mp3",
			"HEI4_PREP_M04_3.mp3",
			"HEI4_PREP_M04_4.mp3",
			"HEI4_PREP_M04_5.mp3",
			"HEI4_PREP_M04_6.mp3"
		},
		intensity = {
			scope_out = { { 1, 2, 4 }, { 1, 2, 3, 4 }, { 1, 2, 4, 5 }, { 1, 2, 5 }, { 1, 2 }, { 1, 2, 3, 4 } },
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 4 } },
			medium = { { 1, 2, 3, 4, 5 }, { 1, 2, 4, 5 }, { 1, 2, 4 } },
			high = { { 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 2, 4, 5, 6 }, { 2, 4, 6 } },
			extreme = { { 2, 3, 4, 5, 6 }, { 2, 3, 4, 6 } },
			cooldown = { 1, 5 }
		}
	},

	hei4_prep_r02 = {
		name = "Prep Track R02",
		gameOrigin = "GTA: Online",
		composer = "Rampa",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_r02",
		stems = {
			"HEI4_PREP_TRACK_R02_1.mp3",
			"HEI4_PREP_TRACK_R02_2.mp3",
			"HEI4_PREP_TRACK_R02_3.mp3",
			"HEI4_PREP_TRACK_R02_4.mp3",
			"HEI4_PREP_TRACK_R02_5.mp3",
			"HEI4_PREP_TRACK_R02_6.mp3",
			"HEI4_PREP_TRACK_R02_7.mp3",
			"HEI4_PREP_TRACK_R02_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 2 }, { 1, 2, 3 } },
			medium = { { 1, 2, 6, 8 }, { 2, 3, 4, 6, 7, 8 }, { 2, 5, 6, 7, 8 } },
			high = { { 1, 2, 6, 8 }, { 2, 3, 4, 6, 7, 8 }, { 2, 5, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 6, 7, 8 }, { 2, 4, 5, 6, 7, 8 }, { 2, 4, 6, 7, 8 } },
			cooldown = { 2, 8 }
		}
	},

	hei4_prep_r06 = {
		name = "Prep Track R06",
		gameOrigin = "GTA: Online",
		composer = "Rampa",
		category = "Cayo Perico Heist",
		path = "gta5/mpheist4/hei4_prep_track_r06",
		stems = {
			"HEI4_PREP_TRACK_R06_1.mp3",
			"HEI4_PREP_TRACK_R06_2.mp3",
			"HEI4_PREP_TRACK_R06_3.mp3",
			"HEI4_PREP_TRACK_R06_4.mp3",
			"HEI4_PREP_TRACK_R06_5.mp3",
			"HEI4_PREP_TRACK_R06_6.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 4 } },
			medium = { { 2, 3, 4, 5 }, { 1, 2, 6 }, { 1, 2, 3, 4 } },
			high = { { 1, 2, 3, 6 }, { 1, 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 1, 2, 4, 6 }, { 1, 2, 6 } },
			extreme = { { 1, 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 5, 6 } },
			cooldown = { 2, 3 }
		}
	},
}

return musicSets