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
