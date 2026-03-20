return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = {
          dotfiles = false,
          custom =
          {
            "\\.class$",
            "\\.iml$",
            "\\.DS_Store",
            "^out$",
            "^target$",
            "^.idea",
          },
          exclude = {},
        },
        -- keybinds
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
      })
    end,
  },
}
