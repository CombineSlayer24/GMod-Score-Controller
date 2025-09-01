local musicSets = {

	alc_agent = {
		name = "ALC Agent",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_agent/",
		stems = {
			"ALC_AGENT_1.mp3",
			"ALC_AGENT_2.mp3",
			"ALC_AGENT_3.mp3",
			"ALC_AGENT_4.mp3",
		},
	},

	alc_car_steal_1_chips = {
		name = "ALC Car Steal",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_car_steal_1_chips/",
		stems = {
			"ALC_CAR_STEAL_1_CHIPS_1.mp3",
			"ALC_CAR_STEAL_1_CHIPS_2.mp3",
		},
		intensity = {
			medium = { { 1 } },
			high = { { 1, 2 } }
		}
	},

	alc_cock_song = {
		name = "ALC Cock Song",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_cock_song/",
		stems = {
			"ALC_COCK_SONG_1.mp3",
		},
		intensity = {
			high = { 1 }
		}
	},

	alc_chop_fred_halen = {
		name = "ALC Chop Fred Halen",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_chop_fred_halen/",
		stems = {
			"ALC_CHOP_FRED_HALEN_1.mp3",
			"ALC_CHOP_FRED_HALEN_2.mp3",
			"ALC_CHOP_FRED_HALEN_3.mp3",
			"ALC_CHOP_FRED_HALEN_4.mp3",
			"ALC_CHOP_FRED_HALEN_5.mp3",
			"ALC_CHOP_FRED_HALEN_6.mp3",
			"ALC_CHOP_FRED_HALEN_7.mp3",
			"ALC_CHOP_FRED_HALEN_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 4, 6, 7 }, { 1, 2, 4, 5, 6 } },
			high = { { 1, 2, 3, 4, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7, 8 }, { 1, 2, 4, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 6, 7, 8 }, { 1, 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 2, 5, 6 }
		}
	},

	alc_eye_in_the_sky_cars2 = {
		name = "ALC Eye In The Sky",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_eye_in_the_sky_cars2/",
		stems = {
			"ALC_EYE_IN_THE_SKY_CARS2_1.mp3",
			"ALC_EYE_IN_THE_SKY_CARS2_2.mp3",
			"ALC_EYE_IN_THE_SKY_CARS2_3.mp3"
		},
		intensity = {
			low = { { 1 } },
			medium = { { 1, 2 } },
			high = { { 1, 2 }, { 1, 2, 3 } }
		}
	},

	alc_funk_jam = {
		name = "ALC Funk Jam",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_funk_jam/",
		stems = {
			"ALC_FUNK_JAM_1.mp3",
			"ALC_FUNK_JAM_2.mp3",
			"ALC_FUNK_JAM_3.mp3"
		},

		intensity = {
			low = { { 1 } },
			medium = { { 1, 2 } },
			high = { { 1, 2, 3 } }
		}
	},

	alc_funk_jam_arm2 = {
		name = "ALC Funk Jam 2",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_funk_jam_arm2/",
		stems = {
			"ALC_FUNK_JAM_ARM2_1.mp3",
			"ALC_FUNK_JAM_ARM2_2.mp3",
			"ALC_FUNK_JAM_ARM2_3.mp3",
			"ALC_FUNK_JAM_ARM2_4.mp3",
		},

		intensity = {
			low = { { 1 } },
			medium = { { 1, 2 } },
			high = { { 1, 2, 3 }, { 1, 2, 3, 4 } },
			extreme = { { 1, 2, 3, 4 } },
			cooldown = { 2 }
		}
	},

	alc_gun_novel = {
		name = "ALC Gun Novel",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_gun_novel/",
		stems = {
			"ALC_GUN_NOVEL_1.mp3",
			"ALC_GUN_NOVEL_2.mp3",
			"ALC_GUN_NOVEL_3.mp3",
			"ALC_GUN_NOVEL_4.mp3",
			"ALC_GUN_NOVEL_5.mp3",
			"ALC_GUN_NOVEL_6.mp3",
			"ALC_GUN_NOVEL_7.mp3",
			"ALC_GUN_NOVEL_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 6, 8 }, { 1, 2, 3, 6, 8 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7, 8 } },
			cooldown = { 2, 6 }
		}
	},

	alc_pb1 = {
		name = "ALC PB1",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_pb1/",
		stems = {
			"ALC_PB1_1.mp3",
			"ALC_PB1_2.mp3",
			"ALC_PB1_3.mp3",
			"ALC_PB1_4.mp3",
			"ALC_PB1_5.mp3",
			"ALC_PB1_6.mp3",
			"ALC_PB1_7.mp3",
			"ALC_PB1_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 3, 4, 6 }, { 1, 4, 6, 7 }, { 2, 3, 4, 5, 6, 8 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 3, 4, 5, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 5, 6, 7, 8 }, { 3, 4, 5, 6, 7, 8 } },
			cooldown = { 2, 6 }
		}
	},

	alc_pb2_pussyface = {
		name = "ALC PB2 Pussyface",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_pb2_pussyface/",
		stems = {
			"ALC_PB2_PUSSYFACE_1.mp3",
			"ALC_PB2_PUSSYFACE_2.mp3",
			"ALC_PB2_PUSSYFACE_3.mp3",
			"ALC_PB2_PUSSYFACE_4.mp3",
			"ALC_PB2_PUSSYFACE_5.mp3",
			"ALC_PB2_PUSSYFACE_6.mp3",
			"ALC_PB2_PUSSYFACE_7.mp3",
			"ALC_PB2_PUSSYFACE_8.mp3"
		},
		intensity = {
			flying = { { 1, 6 }, { 1, 2, 4, 6 }, { 1, 2, 3, 4, 6 }, { 1, 3, 4, 6 } },
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6 }, { 2, 3, 4, 5, 6, 8 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 3, 6 }
		}
	},

	alc_wavery = {
		name = "ALC Wavery",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_wavery/",
		stems = { "alc_wavery_1.mp3"},
		intensity = { high = { { 1 } } }
	},

	alc_vodka = {
		name = "ALC Vodka",
		gameOrigin = "Grand Theft Auto V",
		composer = "The Alchemist",
		path = "gta5/story/alc_vodka/",
		stems = {
			"ALC_VODKA_1.mp3",
			"ALC_VODKA_2.mp3",
			"ALC_VODKA_3.mp3",
			"ALC_VODKA_4.mp3",
			"ALC_VODKA_5.mp3",
			"ALC_VODKA_6.mp3",
			"ALC_VODKA_7.mp3",
			"ALC_VODKA_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 5, 8 }
		}
	},

	ba_metz_debunked = {
		name = "BA Metz Debunked",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream, Woody Jackson, Oh No",
		path = "gta5/story/ba_metz_debunked/",
		stems = {
			"BA_METZ_DEBUNKED_1.mp3",
			"BA_METZ_DEBUNKED_2.mp3",
			"BA_METZ_DEBUNKED_3.mp3",
			"BA_METZ_DEBUNKED_4.mp3",
			"BA_METZ_DEBUNKED_5.mp3",
			"BA_METZ_DEBUNKED_6.mp3",
			"BA_METZ_DEBUNKED_7.mp3",
			"BA_METZ_DEBUNKED_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 6, 7 }, { 1, 2, 3, 4, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7 } },
			cooldown = { 2, 6 }
		}
	},

	ba_metz_love_eggs = {
		name = "BA Metz Love Egss",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream, Woody Jackson, Oh No",
		path = "gta5/story/ba_metz_love_egss/",
		stems = {
			"BA_METZ_LOVE_EGGS_1.mp3",
			"BA_METZ_LOVE_EGGS_2.mp3",
			"BA_METZ_LOVE_EGGS_3.mp3",
			"BA_METZ_LOVE_EGGS_4.mp3",
			"BA_METZ_LOVE_EGGS_5.mp3",
			"BA_METZ_LOVE_EGGS_6.mp3",
			"BA_METZ_LOVE_EGGS_7.mp3",
			"BA_METZ_LOVE_EGGS_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 8 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6, 8 }, { 1, 2, 3, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 1, 4, 5, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 1, 2, 3, 4, 6, 7, 8 } },

			cooldown = { 1, 2, 5, 8 },
			★★★ = { { 2, 5 }, { 2, 8, 5 }, { 5, 8 } },
			★★★★ = { { 2, 3, 6 }, { 3, 5, 8 }, {5, 6, 8 } },
			★★★★★ = {{ 2, 4, 5, 6 }, { 5, 7, 8 }, {3, 5, 7, 8} }
		},
	},

	ba_tboner = {
		name = "BA T-Boner",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream, Woody Jackson, Oh No",
		path = "gta5/story/ba_tboner/",
		stems = {
			"BA_TBONER_1.mp3",
			"BA_TBONER_2.mp3",
			"BA_TBONER_3.mp3",
			"BA_TBONER_4.mp3",
			"BA_TBONER_5.mp3",
			"BA_TBONER_6.mp3",
			"BA_TBONER_7.mp3",
			"BA_TBONER_8.mp3",
		},

		intensity = {
			intro = { 1, 3, 6 },
			rampage = { { 3, 4, 6, 7 }, { 4, 5, 6, 7 }, { 3, 4, 5, 6, 7, 8 } },
		},
	},

	kill_michael = {
		name = "Kill Micheal",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/finale_kill_michael/",
		stems = {
			"FINALE_KILL_MICHAEL_1.mp3",
			"FINALE_KILL_MICHAEL_2.mp3",
			"FINALE_KILL_MICHAEL_3.mp3",
			"FINALE_KILL_MICHAEL_4.mp3"
		},
	},

	finale_kill_trevor = {
		name = "Kill Trevor",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/finale_kill_trevor/",
		stems = {
			"FINALE_KILL_TREVOR_1.mp3",
			"FINALE_KILL_TREVOR_2.mp3"
		},
	},

	rg10 = {
		name = "RG10",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream, Woody Jackson",
		path = "gta5/story/rg10/",
		stems = {
			"RG10_1.mp3",
			"RG10_2.mp3",
			"RG10_3.mp3",
			"RG10_4.mp3",
			"RG10_5.mp3",
			"RG10_6.mp3",
			"RG10_7.mp3",
			"RG10_8.mp3"
		},
	},

	rg15 = {
		name = "RG15",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream, Woody Jackson",
		path = "gta5/story/rg15/",
		stems = {
			"RG15_1.mp3",
			"RG15_2.mp3",
			"RG15_3.mp3",
			"RG15_4.mp3",
			"RG15_5.mp3",
			"RG15_6.mp3",
			"RG15_7.mp3",
			"RG15_8.mp3"
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 2, 3, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 } },
			
			cooldown = { 2, 3 },
			★★★ = { { 2, 5 }, { 2, 5, 8 }, { 5, 6, 8 }, { 2, 6 }, { 2, 3, 6 } },
			★★★★ = { { 2, 3, 6 }, { 2, 3, 6, 7, 8 }, { 5, 6, 8 }, { 6, 7, 8 }, { 5 , 6 } },
			★★★★★ = { { 3, 5, 6, 7 }, { 2, 4, 5, 6 }, { 6, 7, 8 }, { 3, 6, 7 }, { 4, 5, 6, 7 } }
		}
	},

	td_burning_bar = {
		name = "TD Burning Bar",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_burning_bar/",
		stems = {
			"TD_BURNING_BAR_1.mp3",
			"TD_BURNING_BAR_2.mp3",
			"TD_BURNING_BAR_3.mp3",
			"TD_BURNING_BAR_4.mp3",
			"TD_BURNING_BAR_5.mp3",
			"TD_BURNING_BAR_6.mp3",
			"TD_BURNING_BAR_7.mp3",
			"TD_BURNING_BAR_8.mp3"
		},

		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 2, 3, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 3 },
		}
	},

	td_beyond = {
		name = "TD Beyond",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_beyond/",
		stems = {
			"TD_BEYOND_1.mp3",
			"TD_BEYOND_2.mp3",
			"TD_BEYOND_3.mp3",
			"TD_BEYOND_4.mp3"
		},

		intensity = {
			low = { 1 },
			medium = { { 1, 3,}, { 1, 2, 3 } },
			high = { { 1, 3, 4 }, { 3, 4 } },
			extreme = { 1, 2, 3, 4 },
			cooldown = { 1, 3 },
		}
	},

	td_city = {
		name = "TD City",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_city",
		stems = {
			"TD_CITY_1.mp3",
			"TD_CITY_2.mp3",
			"TD_CITY_3.mp3",
			"TD_CITY_4.mp3",
			"TD_CITY_5.mp3",
			"TD_CITY_6.mp3",
			"TD_CITY_7.mp3",
			"TD_CITY_8.mp3",
		},

		intensity = {
			low = {  { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 3, 4, 6 }, { 1, 4, 6, 7 }, { 2, 3, 4, 5, 6, 8 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 3, 4, 5, 6, 7, 8 }, { 1, 4, 6, 7 } },
			extreme = { 1, 3, 4, 5, 6, 7, 8 },
			cooldown = { 2, 5, 6, 8 }
		}
	},

	td_dark_robbery = {
		name = "TD Dark Robbery",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_dark_robbery",
		stems = {
			"TD_DARK_ROBBERY_1.mp3",
			"TD_DARK_ROBBERY_2.mp3",
			"TD_DARK_ROBBERY_3.mp3",
			"TD_DARK_ROBBERY_4.mp3",
			"TD_DARK_ROBBERY_5.mp3",
			"TD_DARK_ROBBERY_6.mp3",
			"TD_DARK_ROBBERY_7.mp3",
			"TD_DARK_ROBBERY_8.mp3",
		},

		intensity = {
			low = {  { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 2, 3, 4, 6 }, { 2, 3,  4, 6, 7 }, { 2, 3, 4, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 2, 4, 5, 6, 7 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 3, 6, 8 }
		}
	},

	td_diamond_diary_fake = {
		name = "TD Diamond Diary Fake",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_diamond_diary_fake",
		stems = {
			"TD_DIAMOND_DIARY_FAKE_1.mp3",
			"TD_DIAMOND_DIARY_FAKE_2.mp3",
			"TD_DIAMOND_DIARY_FAKE_3.mp3",
			"TD_DIAMOND_DIARY_FAKE_4.mp3",
			"TD_DIAMOND_DIARY_FAKE_5.mp3",
			"TD_DIAMOND_DIARY_FAKE_6.mp3",
			"TD_DIAMOND_DIARY_FAKE_7.mp3",
			"TD_DIAMOND_DIARY_FAKE_8.mp3",
		},

		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 3, 8 } },
			medium = { { 2, 3, 4, 6 }, { 2, 4, 6, 7, 8 }, { 2, 3, 4, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 6, 7, 8 }, { 2, 4, 6, 7, 8 } },
			extreme = { { 2, 4, 5, 6, 7, 8 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7, 8 } },
			cooldown = { 2, 6, 8 }
		}
	},

	td_dr_destructo_fake = {
		name = "TD Destructo",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_dr_destructo_fake",
		stems = {
			"TD_DESTRUCTO_1.mp3",
			"TD_DESTRUCTO_2.mp3",
			"TD_DESTRUCTO_3.mp3",
			"TD_DESTRUCTO_4.mp3",
			"TD_DESTRUCTO_5.mp3",
			"TD_DESTRUCTO_6.mp3",
			"TD_DESTRUCTO_7.mp3",
			"TD_DESTRUCTO_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 2, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 3, 4, 6, 7 }, { 2, 3, 4, 5, 6 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 3, 6 }
		}
	},

	td_dragoner = {
		name = "TD Dragoner",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_dragoner",
		stems = {
			"TD_DRAGONER_1.mp3",
			"TD_DRAGONER_2.mp3",
			"TD_DRAGONER_3.mp3",
			"TD_DRAGONER_4.mp3",
			"TD_DRAGONER_5.mp3",
			"TD_DRAGONER_6.mp3",
			"TD_DRAGONER_7.mp3",
			"TD_DRAGONER_8.mp3",
		},

		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 2, 3, 4, 6 }, { 2, 4, 6, 7, 8 }, { 2, 3, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7, 8 } },
			cooldown = { 2, 3, 6 }
		}
	},

	td_greyhound = {
		name = "TD Greyhound (Unused)",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_greyhound",
		stems = {
			"TD_GREYHOUND_1.mp3",
			"TD_GREYHOUND_2.mp3",
			"TD_GREYHOUND_3.mp3",
			"TD_GREYHOUND_4.mp3",
			"TD_GREYHOUND_5.mp3",
			"TD_GREYHOUND_6.mp3",
			"TD_GREYHOUND_7.mp3",
			"TD_GREYHOUND_8.mp3",
		},
	},

	td_scrap_yard = {
		name = "TD Scrap Yard",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_scrap_yard",
		stems = {
			"td_scrap_yard_1.mp3",
			"td_scrap_yard_2.mp3",
			"td_scrap_yard_3.mp3",
			"td_scrap_yard_4.mp3",
			"td_scrap_yard_5.mp3",
			"td_scrap_yard_6.mp3",
			"td_scrap_yard_7.mp3",
			"td_scrap_yard_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 3 }, { 1, 2, 3 } },
			medium = { { 1, 3, 4, 6 }, { 1, 2, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 2, 6 }
		}
	},

	td_streets_of_fortune = {
		name = "TD Streets Of Fortune",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_streets_of_fortune",
		stems = {
			"TD_STREETS_OF_FORTUNE_1.mp3",
			"TD_STREETS_OF_FORTUNE_2.mp3",
			"TD_STREETS_OF_FORTUNE_3.mp3",
			"TD_STREETS_OF_FORTUNE_4.mp3",
			"TD_STREETS_OF_FORTUNE_5.mp3",
			"TD_STREETS_OF_FORTUNE_6.mp3",
			"TD_STREETS_OF_FORTUNE_7.mp3",
			"TD_STREETS_OF_FORTUNE_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 3 }, { 1, 3, 6 } },
			medium = { { 1, 3, 4, 6 }, { 1, 2, 3, 4, 6 }, { 1, 3, 5, 6, 8 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 6 }
		}
	},

	td_universal = {
		name = "TD Universal (Unused)",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_universal",
		stems = {
			"TD_UNIVERSAL_1.mp3",
			"TD_UNIVERSAL_2.mp3",
			"TD_UNIVERSAL_3.mp3",
			"TD_UNIVERSAL_4.mp3",
			"TD_UNIVERSAL_5.mp3",
			"TD_UNIVERSAL_6.mp3",
			"TD_UNIVERSAL_7.mp3",
			"TD_UNIVERSAL_8.mp3",
		},
	},

	td_vacuum = {
		name = "TD Vacuum",
		gameOrigin = "Grand Theft Auto V",
		composer = "Tangerine Dream",
		path = "gta5/story/td_vacuum",
		stems = {
			"TD_VACUUM_1.mp3",
			"TD_VACUUM_2.mp3",
			"TD_VACUUM_3.mp3",
			"TD_VACUUM_4.mp3",
			"TD_VACUUM_5.mp3",
			"TD_VACUUM_6.mp3",
			"TD_VACUUM_7.mp3",
			"TD_VACUUM_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 2 } },
			medium = { { 1, 2, 3, 4, 6 }, { 2, 3, 4, 6, 8 }, { 2, 3, 5, 6 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6 }, { 2, 3, 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7, 8 } },
			cooldown = { { 1, 3, 8 } },

			★★★ = { { 2, 5 }, { 2, 5, 8 }, { 5, 6, 8 }, { 2, 6 }, { 2, 3, 6 } },
			★★★★ = { { 2, 3, 6 }, { 2, 3, 6, 7, 8 }, { 5, 6, 8 }, { 6, 7, 8 }, { 5 , 6 } },
			★★★★★ = { { 3, 5, 6, 7 }, { 2, 4, 5, 6 }, { 6, 7, 8 }, { 3, 6, 7 }, { 4, 5, 6, 7 } }
		}
	},

	wdy_crocodile_tears = {
		name = "WDY Crocodile Tears",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_crocodile_tears",
		stems = {
			"WDY_CROCODILE_TEARS_1.mp3",
			"WDY_CROCODILE_TEARS_2.mp3",
			"WDY_CROCODILE_TEARS_3.mp3",
			"WDY_CROCODILE_TEARS_4.mp3",
			"WDY_CROCODILE_TEARS_5.mp3",
			"WDY_CROCODILE_TEARS_6.mp3",
			"WDY_CROCODILE_TEARS_7.mp3",
			"WDY_CROCODILE_TEARS_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 3, 4, 6 }, { 1, 3, 4, 5, 6 }, { 1, 2, 3, 5, 6 } },
			high = { { 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7 }, { } },
			extreme = { { 1, 3, 4, 5, 6, 7 }, { 1, 4, 5, 6, 7, 8 }, { } },
			cooldown = { 5, 6 }
		}
	},

	wdy_meaty = {
		name = "WDY Meaty",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_meaty",
		stems = {
			"WDY_MEATY_1.mp3",
			"WDY_MEATY_2.mp3",
			"WDY_MEATY_3.mp3",
			"WDY_MEATY_4.mp3",
			"WDY_MEATY_5.mp3",
			"WDY_MEATY_6.mp3",
			"WDY_MEATY_7.mp3",
			"WDY_MEATY_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 6, 8 }, { 1, 2, 3, 5, 6, 8 }, { 1, 2, 3, 5, 6 } },
			high = { { 2, 3, 6, 7, 8 }, { 2, 3, 5, 6, 7, 8 }, { 1, 3, 6, 7 } },
			extreme = { { 2, 3, 5, 6, 7, 8 } },
			cooldown = { 1, 3, 7 }
		}
	},

	wdy_mission_seven = {
		name = "WDY Mission Seven",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_mission_seven",
		stems = {
			"WDY_MISSION_SEVEN_1.mp3",
			"WDY_MISSION_SEVEN_2.mp3",
			"WDY_MISSION_SEVEN_3.mp3",
			"WDY_MISSION_SEVEN_4.mp3",
			"WDY_MISSION_SEVEN_5.mp3",
			"WDY_MISSION_SEVEN_6.mp3",
			"WDY_MISSION_SEVEN_7.mp3",
			"WDY_MISSION_SEVEN_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4 }, { 1, 3, 4, 8 }, { 1, 3, 4, 5, 6 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 3, 4, 5, 6, 7 }, { 1, 3, 4, 7, 8 } },
			extreme = { { 1, 3, 4, 5, 6, 7 }, { 1, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 3, 4 }
		}
	},

	wdy_nine_blurt = {
		name = "WDY Nine Blurt",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_nine_blurt",
		stems = {
			"WDY_NINE_BLURT_1.mp3",
			"WDY_NINE_BLURT_2.mp3",
			"WDY_NINE_BLURT_3.mp3",
			"WDY_NINE_BLURT_4.mp3",
			"WDY_NINE_BLURT_5.mp3",
			"WDY_NINE_BLURT_6.mp3",
			"WDY_NINE_BLURT_7.mp3",
			"WDY_NINE_BLURT_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 4, 6, 7 }, { 1, 2, 4, 5, 6 } },
			high = { { 2, 4, 6, 7 }, { 2, 4, 5, 6, 7, 8 }, { 2, 3, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7 }, { 2, 4, 5, 6, 7, 8 } },
			cooldown = { 4, 5 }
		}
	},

	wdy_rh_bulldozer = {
		name = "WDY RH Bulldozer",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_rh_bulldozer",
		stems = {
			"WDY_RH_BULLDOZER_1.mp3",
			"WDY_RH_BULLDOZER_2.mp3",
			"WDY_RH_BULLDOZER_3.mp3",
		},
		intensity = {
			low = { { 1 } },
			medium = { { 1, 2 } },
			high = { { 1, 2, 3 } }
		}
	},

	wdy_sapstick = {
		name = "WDY Sapstick",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_sapstick",
		stems = {
			"WDY_SAPSTICK_1.mp3",
			"WDY_SAPSTICK_3.mp3",
			"WDY_SAPSTICK_4.mp3",
			"WDY_SAPSTICK_5.mp3",
			"WDY_SAPSTICK_6.mp3",
			"WDY_SAPSTICK_7.mp3",
			"WDY_SAPSTICK_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 3 } },
			medium = { { 1, 3, 4, 6 }, { 1, 3, 4, 6, 8 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7, 8 } },
			extreme = { { 1, 3, 4, 5, 6, 7 }, { 1, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 4, 8 }
		}
	},

	wdy_silver_pussy = {
		name = "WDY Silver Pussy",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_silver_pussy",
		stems = {
			"WDY_SILVER_PUSSY_1.mp3",
			"WDY_SILVER_PUSSY_2.mp3",
			"WDY_SILVER_PUSSY_3.mp3",
			"WDY_SILVER_PUSSY_4.mp3",
			"WDY_SILVER_PUSSY_5.mp3",
			"WDY_SILVER_PUSSY_6.mp3",
			"WDY_SILVER_PUSSY_7.mp3",
			"WDY_SILVER_PUSSY_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 3, 4, 6, 8 }, { 1, 2, 3, 5, 6 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7 } },
			cooldown = { 1, 4 }
		}
	},

	wdy_sticky_vicky = {
		name = "WDY Sticky Vicky",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_sticky_vicky",
		stems = {
			"WDY_STICKY_VICKY_1.mp3",
			"WDY_STICKY_VICKY_2.mp3",
			"WDY_STICKY_VICKY_3.mp3",
			"WDY_STICKY_VICKY_4.mp3",
			"WDY_STICKY_VICKY_5.mp3",
			"WDY_STICKY_VICKY_6.mp3",
			"WDY_STICKY_VICKY_7.mp3",
			"WDY_STICKY_VICKY_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6 }, { 1, 3, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 3, 4 }
		}
	},

	wdy_track_8 = {
		name = "WDY Track 8",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_track_8",
		stems = {
			"WDY_TRACK_8_1.mp3",
			"WDY_TRACK_8_2.mp3",
			"WDY_TRACK_8_3.mp3",
			"WDY_TRACK_8_4.mp3",
			"WDY_TRACK_8_5.mp3",
			"WDY_TRACK_8_6.mp3",
			"WDY_TRACK_8_7.mp3",
			"WDY_TRACK_8_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 3, 4, 6 }, { 1, 2, 3, 5, 6 }, { 1, 3, 4, 6, 8 } },
			high = { { 3, 4, 5, 6 }, { 3, 6, 7, 8 } },
			extreme = { { 2, 3, 5, 6, 7 }, { 2, 3, 6, 7, 8 } },
			cooldown = { 2, 5, 6 }
		}
	},

	wdy_vinegar_tits = {
		name = "WDY Vinegar Tits",
		gameOrigin = "Grand Theft Auto V",
		composer = "Woody Jackson",
		path = "gta5/story/wdy_vinegar_tits",
		stems = {
			"WDY_VINEGAR_TITS_1.mp3",
			"WDY_VINEGAR_TITS_2.mp3",
			"WDY_VINEGAR_TITS_3.mp3",
			"WDY_VINEGAR_TITS_4.mp3",
			"WDY_VINEGAR_TITS_5.mp3",
			"WDY_VINEGAR_TITS_6.mp3",
			"WDY_VINEGAR_TITS_7.mp3",
			"WDY_VINEGAR_TITS_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6 }, { 1, 2, 3, 5, 6, 8 } },
			high = { { 1, 3, 6, 7 }, { 1, 3, 5, 6, 7 }, { 1, 2, 6, 7 } },
			extreme = { { 1, 3, 5, 6, 7 }, { 1, 2, 3, 5, 6, 7 } },
			cooldown = { 1, 4 }
		}
	},
}

return musicSets