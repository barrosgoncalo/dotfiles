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
        -- configs
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {},
            },
        })
        vim.lsp.config("jdtls", {
            settings = {}
        })

        vim.lsp.config("ts_ls", {})

        vim.lsp.config("pylsp", {
            settings = {
                pylsp = {
                    plugins = {
                        -- formatter options
                        black = { enabled = true },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        -- linter options
                        pylint = { enabled = true, executable = "pylint" },
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                        -- type checker
                        pylsp_mypy = { enabled = true },
                        -- auto-completion options
                        jedi_completion = { fuzzy = true },
                        -- import sorting
                        pyls_isort = { enabled = true },
                    },
                },
            },
            flags = {
                debounce_text_changes = 200,
            },
        })

        vim.lsp.config("bufls", {})

        -- enables
        vim.lsp.enable('lua_ls')
        vim.lsp.enable("jdtls")
        vim.lsp.enable("bufls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("pylsp")

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
