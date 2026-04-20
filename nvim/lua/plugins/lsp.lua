return {
  "neovim/nvim-lspconfig",
  dependencies = {
     {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {},
      },
    })
    vim.lsp.config("bufls", {})

    vim.lsp.enable('lua_ls')
    vim.lsp.enable("jdtls")
    vim.lsp.enable("bufls")

    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      underline = true,
    })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP Rename' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover Documentation' })
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' })
  end
}
