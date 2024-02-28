return {
  -- {
  --   "sainnhe/gruvbox-material",
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.o.background = "dark" -- or "light" for light mode
  --     vim.cmd("let g:gruvbox_material_background= 'hard'")
  --     vim.cmd("let g:gruvbox_material_transparent_background=2")
  --     vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
  --     vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
  --     vim.cmd("let g:gruvbox_material_enable_bold=1")
  --     vim.cmd("let g:gruvbox_material_enable_italic=1")
  --     vim.cmd([[colorscheme gruvbox-material]]) -- Set color scheme
  --     -- changing bg and border colors
  --     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
  --     vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  --   end
  -- },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavor = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        noice = true,
        neotree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  }

}
