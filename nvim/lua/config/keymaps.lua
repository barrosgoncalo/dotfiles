vim.keymap.set('n', '<leader>tt', ':tabnew | term<CR>', { desc = 'Terminal in new tab' })

-- Arrow keys disabled
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("", "<left>", "<nop>", { noremap = true })
vim.keymap.set("", "<right>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })

-- Abbreviations
vim.keymap.set("i", "sout<Tab>", 'System.out.println();<Left><Left>')
vim.keymap.set("i", "souf<Tab>", 'System.out.printf();<Left><Left>')

-- TODO
--Drag lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Scrolling
vim.keymap.set("n", "<C-d>", "2<C-d>")
vim.keymap.set("n", "<C-u>", "2<C-u>")
