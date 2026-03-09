-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Leader Key
-- ----------------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "

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
vim.opt.termguicolors = true

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Plugins 
-- ----------------------------------------------------------------------------------------------------------------------------------------------
require("lazy").setup("plugins")

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Editor Setting (Looks & Feel)
-- ----------------------------------------------------------------------------------------------------------------------------------------------

--Turn on the theme
vim.o.background = "dark" -- change to "light" if you prefer light mode
vim.cmd([[colorscheme gruvbox]])

--Show line numbers
vim.opt.number = true

--Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 4

-- Easy Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Mouse and Arrow keys disable
vim.opt.mouse = ""
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Spell checking
vim.opt.spell = true
-- Set language
vim.opt.spelllang = { 'en_us' }
