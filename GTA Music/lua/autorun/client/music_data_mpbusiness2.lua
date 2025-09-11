local musicSets = {

	nt_chu = {
		name = "NT CHU",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist, Oh No",
		category = "High Life 2014",
		path = "gta5/mpbusiness2/nt_chu",
		stems = {
			"NT_CHU_1.mp3",
			"NT_CHU_2.mp3",
			"NT_CHU_3.mp3",
			"NT_CHU_4.mp3",
			"NT_CHU_5.mp3",
			"NT_CHU_6.mp3",
			"NT_CHU_7.mp3",
			"NT_CHU_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 4, 5, 6 }, { 1, 2, 5, 6, 8 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 4, 5, 6, 7, 8 } },
			cooldown = { 5, 6 }
		}
	},

	nt_def = {
		name = "NT DEF",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist, Oh No",
		category = "High Life 2014",
		path = "gta5/mpbusiness2/nt_def",
		stems = {
			"NT_DEF_1.mp3",
			"NT_DEF_2.mp3",
			"NT_DEF_3.mp3",
			"NT_DEF_4.mp3",
			"NT_DEF_5.mp3",
			"NT_DEF_6.mp3",
			"NT_DEF_7.mp3",
			"NT_DEF_8.mp3",
		},
		intensity = {
			low = { { 1 }, { 1, 2 }, { 1, 2, 3 }, { 1, 3 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 3, 4, 6, 8 }, { 1, 2, 3, 5, 6, 8 } },
			high = { { 2, 3, 4, 6, 7 }, { 2, 3, 4, 5, 6 }, { 3, 4, 5, 6, 7 }, { 1, 3, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7, 8 }, { 1, 3, 4, 6, 7, 8 } },
			cooldown = { 3, 6 }
		}
	},

	nt_elc = {
		name = "NT ELC",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist, Oh No",
		category = "High Life 2014",
		path = "gta5/mpbusiness2/nt_elc",
		stems = {
			"NT_ELC_1.mp3",
			"NT_ELC_2.mp3",
			"NT_ELC_3.mp3",
			"NT_ELC_4.mp3",
			"NT_ELC_5.mp3",
			"NT_ELC_6.mp3",
			"NT_ELC_7.mp3",
			"NT_ELC_8.mp3",
		},
		intensity = {
			low = { { 1, 2 }, { 1, 2, 3 }, { 2 } },
			medium = { { 1, 3, 4, 6 }, { 1, 3, 4, 6, 8 }, { 1, 2, 3, 5, 6 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 3, 4, 6, 7, 8 }, { 1, 3, 4, 5, 6 } },
			extreme = { { 1, 3, 4, 5, 6, 7, 8 }, { 1, 3, 4, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7 } },
			cooldown = { 2, 6 }
		}

	},

	nt_pb2 = {
		name = "NT PB2",
		gameOrigin = "GTA: Online",
		composer = "The Alchemist, Oh No",
		category = "High Life 2014",
		path = "gta5/mpbusiness2/nt_pb2",
		stems = {
			"NT_PB2_1.mp3",
			"NT_PB2_2.mp3",
			"NT_PB2_3.mp3",
			"NT_PB2_4.mp3",
			"NT_PB2_5.mp3",
			"NT_PB2_6.mp3",
			"NT_PB2_7.mp3",
			"NT_PB2_8.mp3",
		},
		intensity = {
			low = { { 1, 3 }, { 1, 2, 3 }, { 1, 2 }, { 1 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 3, 4, 5, 6 }, { 1, 4, 5, 6 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 6, 7 }, { 1, 4, 5, 6, 7 }, { 1, 2, 4, 6, 7 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 6, 7 }, { 1, 4, 5, 6, 7, 8 } },
			cooldown = { 5, 6 }
		}
	},
}

return musicSets