return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
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
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- configs
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {},
            },
        })

        vim.lsp.config("jdtls", {
            capabilities = capabilities,
            settings = {},
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
        })

        vim.lsp.config("pylsp", {
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        black = { enabled = true },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },

                        pylint = {
                            enabled = true,
                            executable = "pylint",
                        },

                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },

                        pylsp_mypy = { enabled = true },

                        jedi_completion = {
                            fuzzy = true,
                        },

                        pyls_isort = {
                            enabled = true,
                        },
                    },
                },
            },

            flags = {
                debounce_text_changes = 200,
            },
        })

        vim.lsp.config("bufls", {
            capabilities = capabilities,
        })

        vim.lsp.config("lemminx", {
            capabilities = capabilities,
            filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "xacml" },
            settings = {
                xml = {
                    format = {
                        enabled = true,
                        splitAttributes = true,
                    },
                    validation = {
                        enabled = true,
                        noGrammar = "hint",
                    },
                },
            },
        })

        vim.lsp.config("ocamllsp", {
            capabilities = capabilities,
            settings = {},
        })

        -- enable
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("jdtls")
        vim.lsp.enable("bufls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("pylsp")
        vim.lsp.enable("lemminx")
        vim.lsp.enable("ocamllsp")

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            underline = true,
        })

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
        { desc = "Code Actions" })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
        { desc = "LSP Rename" })

        vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { desc = "LSP Hover Documentation" })

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
        { desc = "Show Line Diagnostics" })
    end,
}
