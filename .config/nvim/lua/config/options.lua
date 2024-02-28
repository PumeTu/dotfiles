vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UXUI
vim.o.clipboard = "unnamedplus" -- sync clipboard to system
vim.o.completeopt = "menu,menuone,noselect"
vim.o.mouse = "a"
vim.o.number = true --line number
vim.o.scrolloff = 8 -- lines of context
vim.o.sidescrolloff = 8 -- columns of context
vim.o.relativenumber = true -- relative line number
vim.o.termguicolors = true -- true color support

-- Tabs + Indentations
vim.o.expandtab = true -- number of spaces a tab counts for (insert mode)
vim.o.shiftwidth = 2 -- number of spaes to use for each auto indent
vim.o.smartindent = true -- smart auto indenting
vim.o.softtabstop = 2 -- number of spaces a tab counts for
vim.o.tabstop = 2 -- number of spaces a tab counts for
vim.o.wrap = false -- wrap line or not if appears of screen

-- Search
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.smartcase = true -- override ignorecase

vim.g.markdown_recommended_style = 0
vim.g.python3_host_prog = "$/home/pumetu/miniconda3/bin/python3"
