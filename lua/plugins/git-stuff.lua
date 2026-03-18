return {
  {

    "tpope/vim-fugitive",
    lazy = false,
    keys = { -- Conflict split screen
      { "<leader>gs", "<cmd>Gvdiffsplit!<cr>", desc = "Git Merge (3-way)" },
      -- Conflict Resolution (Get from Left/Right)
      { "<leader>gh", "<cmd>diffget //2<cr>", desc = "Git Accept Left (Local)" },
      { "<leader>gl", "<cmd>diffget //3<cr>", desc = "Git Accept Right (Remote)" },

    }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>hb", ":Gitsigns blame_line<CR>", {})
    end
  }
}
