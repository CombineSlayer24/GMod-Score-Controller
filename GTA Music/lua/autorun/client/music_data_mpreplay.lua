local musicSets = {

	fm_cars = {
		name = "Freemode Cars",
		gameOrigin = "GTA: Online",
		composer = "Woody Jackson, The Alchemist, Oh No, Tangerine Dream",
		category = "Freemode Events Update",
		path = "gta5/mpreplay/fm_cars",
		stems = {
			"FM_CARS_1.mp3",
			"FM_CARS_2.mp3",
			"FM_CARS_3.mp3",
			"FM_CARS_4.mp3",
			"FM_CARS_5.mp3",
			"FM_CARS_6.mp3",
			"FM_CARS_7.mp3",
			"FM_CARS_8.mp3"
		},
	},

	fm_fresh_mode = {
		name = "Freemode Fresh Mode",
		gameOrigin = "GTA: Online",
		composer = "Woody Jackson, The Alchemist, Oh No, Tangerine Dream",
		category = "Freemode Events Update",
		path = "gta5/mpreplay/fm_fresh_mode",
		stems = {
			"FM_FRESH_MODE_1.mp3",
			"FM_FRESH_MODE_2.mp3",
			"FM_FRESH_MODE_3.mp3",
			"FM_FRESH_MODE_4.mp3",
			"FM_FRESH_MODE_5.mp3",
			"FM_FRESH_MODE_6.mp3",
			"FM_FRESH_MODE_7.mp3",
			"FM_FRESH_MODE_8.mp3"
		},
		intensity = {
			low = { { 3, 6 }, { 3, 6, 8 }, { 3, 5, 8 }, { 3 } },
			medium = { { 3, 4, 5, 6 }, { 3, 4, 6, 8 }, { 1, 3, 4, 6, 8 }, { 1, 2, 3, 5, 6, 8 } },
			high = { { 3, 4, 6, 7 }, { 2, 3, 4, 5, 6, 7 }, { 3, 4, 6, 7, 8 }, { 1, 3, 4, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7 } },
			extreme = { { 3, 4, 5, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7 } },
			cooldown = { 5, 6 }
		}
	},

	fm_plus_one = {
		name = "Freemode Plus One",
		gameOrigin = "GTA: Online",
		composer = "Woody Jackson, The Alchemist, Oh No, Tangerine Dream",
		category = "Freemode Events Update",
		path = "gta5/mpreplay/fm_plus_one",
		stems = {
			"FM_PLUS_ONE_1.mp3",
			"FM_PLUS_ONE_2.mp3",
			"FM_PLUS_ONE_3.mp3",
			"FM_PLUS_ONE_4.mp3",
			"FM_PLUS_ONE_5.mp3",
			"FM_PLUS_ONE_6.mp3",
			"FM_PLUS_ONE_7.mp3",
			"FM_PLUS_ONE_8.mp3"
		},
	},

	fm_sudden_death = {
		name = "Freemode Sudden Death",
		gameOrigin = "GTA: Online",
		composer = "Woody Jackson, The Alchemist, Oh No, Tangerine Dream",
		category = "Freemode Events Update",
		path = "gta5/mpreplay/fm_sudden_death",
		stems = {
			"FM_SUDDEN_DEATH_NINE_1.mp3",
		},
		intensity = {
			extreme = { 1 }
		}
	},

	fm_univ = {
		name = "Freemode Universal",
		gameOrigin = "GTA: Online",
		composer = "Woody Jackson, The Alchemist, Oh No, Tangerine Dream",
		category = "Freemode Events Update",
		path = "gta5/mpreplay/fm_univ",
		stems = {
			"FM_UNIV_1.mp3",
			"FM_UNIV_2.mp3",
			"FM_UNIV_3.mp3",
			"FM_UNIV_4.mp3",
			"FM_UNIV_5.mp3",
			"FM_UNIV_6.mp3",
			"FM_UNIV_7.mp3",
			"FM_UNIV_8.mp3"
		},
		intensity = {
			low = { { 3, 8 }, { 8 } },
			medium = { { 2, 3, 4 }, { 2, 4, 5 }, { 6, 8 }, { 4, 5, 8 } },
			high = { { 2, 4, 5, 7 }, { 4, 6, 7, 8 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 3, 4, 6, 7, 8 }, { 2, 3, 4, 5, 7, 8 } },
			cooldown = { 8 }
		}
	},
}

return musicSets