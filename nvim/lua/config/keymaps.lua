
local professor_mode = require("config.modes.professor_mode")

-- Terminal in a new tab
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("tabnew")
    vim.cmd("terminal")
end, { desc = "Terminal in new tab" })

-- Professor mode
vim.api.nvim_create_user_command("ProfessorMode", function()
    professor_mode.toggle()
end, { desc = "Toggle professor mode" })

vim.keymap.set("n", "<leader>tp", function()
    professor_mode.toggle()
end, { desc = "Toggle professor mode" })

-- Abbreviations
vim.keymap.set("i", "sout<Tab>", "System.out.println();<Left><Left>")
vim.keymap.set("i", "souf<Tab>", "System.out.printf();<Left><Left>")

-- Drag lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")

-- Scrolling
vim.keymap.set("n", "<C-d>", "2<C-d>")
vim.keymap.set("n", "<C-u>", "2<C-u>")

