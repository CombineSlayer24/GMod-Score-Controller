local musicSets = {
	halloween_2015 = {
		name = "Halloween 2015",
		gameOrigin = "GTA: Online",
		composer = "Edgar Froese, The Alchemist, Oh No, Tangerine Dream",
		category = "Halloween",
		path = "gta5/mphalloween/halloween_2015/",
		stems = {
			"HALLOWEEN_2015_1.mp3",
			"HALLOWEEN_2015_2.mp3",
			"HALLOWEEN_2015_3.mp3",
			"HALLOWEEN_2015_4.mp3",
			"HALLOWEEN_2015_5.mp3",
			"HALLOWEEN_2015_6.mp3",
			"HALLOWEEN_2015_7.mp3",
			"HALLOWEEN_2015_8.mp3",
		},
		intensity = {
			ghost = { { 1 } },
			low = { { 1 }, { 1, 2 }, { 1, 2, 3 }, { 2, 3 } },
			medium = { { 2, 3, 4, 6 }, { 2, 3, 4, 5, 6 }, { 2, 3, 5, 6, 8 } },
			high = { { 2, 3, 4, 5, 6, 7 }, { 2, 3, 4, 6, 7, 8 }, { 2, 3, 4, 6, 7 } },
			extreme = { { 2, 3, 4, 5, 6, 7, 8 }, { 2, 3, 4, 5, 6, 7 } },
			cooldown = { 2, 4, 6 }
		}
	},

	mp231_nh_halloween = {
		name = "Halloween 2023",
		gameOrigin = "GTA: Online",
		composer = "Unknown",
		category = "Halloween",
		path = "gta5/mp2023_01/mp231_nh_halloween/",
		stems = {
			"mp231_nh_halloween_1.mp3",
			"mp231_nh_halloween_2.mp3",
			"mp231_nh_halloween_3.mp3",
			"mp231_nh_halloween_4.mp3",
			"mp231_nh_halloween_5.mp3",
			"mp231_nh_halloween_6.mp3",
			"mp231_nh_halloween_7.mp3",
			"mp231_nh_halloween_8.mp3",
		},
		intensity = {
			ghost = { { 1 } },
			low = { { 1 }, { 1, 2 }, { 1, 2, 3 }, { 1, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 3, 4, 5, 6 }, { 1, 2, 5, 6, 8 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 1, 3, 4, 5, 6, 7 }, { 1, 4, 5, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7, 8 }, { 1, 2, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 4, 6 }
		}
	},

	mp241_altsm_halloween = {
		name = "Halloween 2024",
		gameOrigin = "GTA: Online",
		composer = "Unknown",
		category = "Halloween",
		path = "gta5/mp2024_01/mp241_altsm_halloween/",
		stems = {
			"mp241_altsm_halloween_1.mp3",
			"mp241_altsm_halloween_2.mp3",
			"mp241_altsm_halloween_3.mp3",
			"mp241_altsm_halloween_4.mp3",
			"mp241_altsm_halloween_5.mp3",
			"mp241_altsm_halloween_6.mp3",
			"mp241_altsm_halloween_7.mp3",
			"mp241_altsm_halloween_8.mp3",
		},
		intensity = {
			ghost = { { 1 } },
			low = { { 1 }, { 1, 5 }, { 1, 3, 5 } },
			medium = { { 1, 3, 4, 6 }, { 1, 4, 5, 6 }, { 1, 4, 6, 8 } },
			high = { { 1, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 6, 7 }, { 1, 4, 5, 6, 7, 8 } },
			extreme = { { 1, 2, 3, 4, 5, 6, 7, 8 }, { 1, 3, 4, 5, 6, 7, 8 } },
			cooldown = { 1, 4, 8 }
		}
	},

	mp251_zsm_jnsns = {
		name = "Halloween 2025",
		gameOrigin = "GTA: Online",
		composer = "Unknown",
		category = "Halloween",
		path = "gta5/mp2025_01/mp251_zsm_jnsns/",
		stems = {
			"mp251_zsm_jnsns_1.mp3",
			"mp251_zsm_jnsns_2.mp3",
			"mp251_zsm_jnsns_3.mp3",
			"mp251_zsm_jnsns_4.mp3",
			"mp251_zsm_jnsns_5.mp3",
			"mp251_zsm_jnsns_6.mp3",
			"mp251_zsm_jnsns_7.mp3",
			"mp251_zsm_jnsns_8.mp3",
		},
		intensity = {
			ghost = { { 1 } },
			low = { { 1 }, { 1, 2, 3 }, { 1, 2, 5 } },
			medium = { { 1, 2, 3, 4, 6 }, { 1, 2, 3, 4, 5, 6 }, { 1, 2, 4, 5 } },
			high = { { 1, 2, 3, 4, 6, 7 }, { 1, 2, 3, 4, 5, 7 }, { 1, 2, 3, 4, 5, 6, 7 } },
			extreme = { 1, 2, 3, 4, 5, 8 },
			cooldown = { 1, 3, 7 }
		}
	},
}

return musicSets