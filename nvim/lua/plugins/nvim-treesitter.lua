return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local install_dir = vim.fn.stdpath("data") .. "/site"
    vim.opt.runtimepath:prepend(install_dir)

    vim.filetype.add({
      extension = {
        js = "javascriptreact",
        tsx = "typescriptreact",
      },
    })

    require("nvim-treesitter").setup({
      install_dir = install_dir,
    })

    require("nvim-treesitter").install({
      "c",
      "java",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "latex",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "java",
        "python",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "lua",
        "vim",
        "vimdoc",
        "query",
      },
      callback = function(args)
        local lang_map = {
          javascriptreact = "javascript",
          typescriptreact = "tsx",
        }
        local lang = lang_map[args.match] or args.match
        pcall(vim.treesitter.start, args.buf, lang)

        local js_types = {
          javascript = true, javascriptreact = true,
          typescript = true, typescriptreact = true,
        }
        if js_types[args.match] then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.bo[args.buf].smartindent = false
          vim.bo[args.buf].cindent = false
        end

        if args.match == "python" then
          vim.bo[args.buf].syntax = "python"
        end
      end,
    })
  end,
}
