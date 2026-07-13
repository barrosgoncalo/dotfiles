return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      { "<leader>gs", "<cmd>Gvdiffsplit!<cr>", desc = "Git Merge (3-way)" },
      
      { "<leader>gh", ":diffget //2<cr>", mode = { "n", "v" }, desc = "Git Accept Left (Local)" },
      { "<leader>gl", ":diffget //3<cr>", mode = { "n", "v" }, desc = "Git Accept Right (Remote)" },
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
