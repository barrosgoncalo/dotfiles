--Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- PEP 8 double-indent override (python)
vim.g.python_indent = {
    open_paren = 'shiftwidth()',
    continue = 'shiftwidth()',
    closed_paren_align_last_line = false,
}

-- Mouse disabled
vim.opt.mouse = ""

-- Spell checking
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'pt_pt' }
