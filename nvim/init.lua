-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Leader Key
-- ----------------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>tt', ':tabnew | term<CR>', { desc = 'Terminal in new tab' })

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- BOOTSTRAP Lazy.nvim
-- ----------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Download and setup the 'lazy.nvim' plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Plugins 
-- ----------------------------------------------------------------------------------------------------------------------------------------------
require("lazy").setup("plugins")

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Editor Setting (Looks & Feel)
-- ----------------------------------------------------------------------------------------------------------------------------------------------

--Turn on the theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

--Show line numbers
vim.opt.number = true
--Show line relative numbers
vim.opt.relativenumber = true

--Indentation
-- spaces a <Tab> counts
vim.opt.tabstop = 4

-- spaces for (auto)indent
vim.opt.shiftwidth = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Backspace delete 4 spaces at once
vim.opt.softtabstop = 4

-- Copy indentation from the previous line when starting a new line
vim.opt.autoindent = true

vim.opt.smartindent = true


-- Easy Window Navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Mouse and Arrow keys disable
vim.opt.mouse = ""
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Spell checking
vim.opt.spell = true
-- Set language
vim.opt.spelllang = { 'en_us', 'pt_pt' }


vim.env.PATH = vim.env.PATH .. ":/Library/TeX/texbin"
vim.env.PATH = vim.env.PATH .. ":/opt/homebrew/bin:/usr/local/bin"

-- Abbreviations __
vim.keymap.set("i", "sout<Tab>", 'System.out.println();<Left><Left>')
