return {
  vim.keymap.set("n", "z=", "<cmd>Telescope spell_suggest<CR>", { desc = "Spelling Suggestions" }),
  -- turn highlights off
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
}
