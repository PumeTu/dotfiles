return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ formatters = { "injected" } })
				end,
				mode = { "n", "v" },
				desc = "Code Format injected language",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				python = { "ruff" },
			}
		end,
	},
}
