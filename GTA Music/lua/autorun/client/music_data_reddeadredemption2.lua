local musicSets = {

	bob_127 = {
		name = "BOB_127_AMB_OW",
		gameOrigin = "Red Dead Redemption 2",
		composer = "Woody Jackson",
		category = "Red Dead Redemption 2",
		path = "rdr2/bob_127_amb_ow",
		stems = {
			"BOB_127_AMB_OW_1.mp3",
			"BOB_127_AMB_OW_2.mp3",
			"BOB_127_AMB_OW_3.mp3",
			"BOB_127_AMB_OW_4.mp3",
			"BOB_127_AMB_OW_5.mp3",
			"BOB_127_AMB_OW_6.mp3",
			"BOB_127_AMB_OW_7.mp3",
			"BOB_127_AMB_OW_8.mp3",
			"BOB_127_AMB_OW_9.mp3"
		},

		intensity = {
			low = { { 2, 4 }, { 4, 5 }, { 4, 5, 6 }, { 4, 6 } },
			medium = { { 4, 5, 6, 8 }, { 4, 5, 6, 8 }, { 4, 6, 9 } },
			high = { { 5, 6, 7, 8 }, { 5, 6, 8, 9 } },
			extreme = { 5, 6, 7, 8, 9 },
			cooldown = { 4, 6, 8 }
		}

	},
	bob_29 = {
		name = "BOB_29_AMB_OW",
		gameOrigin = "Red Dead Redemption 2",
		composer = "Woody Jackson",
		category = "Red Dead Redemption 2",
		path = "rdr2/bob_29_amb_ow",
		stems = {
			"BOB_29_AMB_OW_1.mp3",
			"BOB_29_AMB_OW_2.mp3",
			"BOB_29_AMB_OW_3.mp3",
			"BOB_29_AMB_OW_4.mp3",
			"BOB_29_AMB_OW_5.mp3",
			"BOB_29_AMB_OW_6.mp3",
			"BOB_29_AMB_OW_7.mp3",
			"BOB_29_AMB_OW_8.mp3",
			"BOB_29_AMB_OW_9.mp3",
			"BOB_29_AMB_OW_10.mp3",
			"BOB_29_AMB_OW_11.mp3"
		},

		intensity = {
			low = { { 4, 5 }, { 5 } },
			medium = { { 4, 5, 6, 10 }, { 4, 5, 7, 10 }, { 4, 5, 6 } },
			high = { { 5, 6, 8, 10 }, { 5, 8, 10 }, { 4, 5, 10 } },
			extreme = { 5, 6, 8, 10, 11, 5, 8, 10, 11, 4, 5, 10, 11 },
			cooldown = { 4, 5, 10 }
		}
	}
}

return musicSets