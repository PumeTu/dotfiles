return {
	-- Mini pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			mappings = {
				["'"] = false,
			},
		},
	},
	-- Mini comment
	{
		"echasnovski/mini.comment",
		version = false,
		opts = {},
	},
	-- Mini clue
	{
		"echasnovski/mini.clue",
		version = "*",
		config = function()
			local miniclue = require("mini.clue")
			miniclue.setup({
				triggers = {
					{ mode = "n", keys = "<leader>" },
					{ mode = "x", keys = "<leader>" },
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "<C>" },
					{ mode = "x", keys = "<C>" },
					{ mode = "i", keys = "<C>" },
				},
				clues = {
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
		end,
	},
}
