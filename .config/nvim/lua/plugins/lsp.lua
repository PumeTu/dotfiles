return {
	-- Auto complete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = { src = { cmp = { enabled = true } } },
			},
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "crates" },
					{ name = "path" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			local servers = {
				-- LSPs
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = {
							disable = { "missing-fields" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
				rust_analyzer = {
					settings = {
						["rust_analyzer"] = {
							checkOnSave = { command = "clippy" },
						},
					},
				},
				pyright = {},
			}

			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP" .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end
				nmap("gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition")
				nmap("gr", "<cmd>Telescope lsp_references<cr>", "Goto References")
				nmap("gi", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation")
				nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")
				nmap("<leader>D", "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			})
		end,
	},
}
