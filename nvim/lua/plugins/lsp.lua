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
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {},
            },
        })

        vim.lsp.config("jdtls", {
            root_dir = function(bufnr, on_dir)
                local root = vim.fs.root(bufnr, { ".project", ".classpath", ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
                or vim.fn.getcwd()
                on_dir(root)
            end,
            settings = {
                java = {
                    autobuild = { enabled = true },
                },
            },
        })

        vim.lsp.config("pylsp", {
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

        vim.lsp.config("lemminx", {
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
            cmd = { vim.fn.expand("~/.opam/ocaml-lsp-tools/bin/ocamllsp") },
        })

        vim.lsp.config("sqlls", {
            filetypes = { "sql", "mysql" },
        })

        -- enable
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("jdtls")
        vim.lsp.enable("bufls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("pylsp")
        vim.lsp.enable("lemminx")
        vim.lsp.enable("ocamllsp")
        vim.lsp.enable("sqlls")

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            underline = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, fn, desc)
                    vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = desc })
                end
                local builtin = function(name, opts)
                    return function() require("telescope.builtin")[name](opts) end
                end

                -- actions
                map("<leader>ca", vim.lsp.buf.code_action, "Code Actions")
                map("<leader>rn", vim.lsp.buf.rename, "LSP Rename")
                map("K", vim.lsp.buf.hover, "LSP Hover Documentation")

                -- navigation (Telescope)
                map("gd", builtin("lsp_definitions"), "Goto Definition")
                map("gr", builtin("lsp_references"), "Goto References")
                map("gi", builtin("lsp_implementations"), "Goto Implementation")

                -- symbols (Telescope)
                map("<leader>ds", builtin("lsp_document_symbols"), "Document Symbols")
                map("<leader>dm", builtin("lsp_document_symbols",
                { symbols = { "method", "constructor", "function" } }), "Document Methods")
                map("<leader>ws", builtin("lsp_dynamic_workspace_symbols"), "Workspace Symbols")
            end,
        })

        -- diagnostics can exist without an LSP, so this one stays global
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
    end,
}
