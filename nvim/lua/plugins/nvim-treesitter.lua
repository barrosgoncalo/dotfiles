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
        "lua",
        "vim",
        "vimdoc",
        "query",
      },
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })

  end,
}
