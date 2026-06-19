return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()

    local install_dir = vim.fn.stdpath("data") .. "/site"

    vim.opt.runtimepath:prepend(install_dir)

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
        "tsx",
        "lua",
        "vim",
        "vimdoc",
        "query",
      },

      vim.filetype.add({
          extension = {
              js = "javascriptreact",
          }
      }),

      callback = function(args)
    local lang = args.match == "javascriptreact" and "javascript" or args.match
    pcall(vim.treesitter.start, args.buf, lang)
    if args.match == "javascriptreact" or args.match == "javascript" or
       args.match == "typescript" or args.match == "tsx" then
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.bo[args.buf].smartindent = false
        vim.bo[args.buf].cindent = false
    end
    if args.match == "python" then
        vim.bo[args.buf].syntax = "python"
    end
end
  })

  end,
}
