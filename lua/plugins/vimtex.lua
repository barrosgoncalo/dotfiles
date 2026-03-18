return {
  {
    "lervag/vimtex",
    lazy = false,
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method = "skim"
      -- manage build auxiliary folders
      -- vim.g.vimtex_compiler_latexmk = {
      --   aux_dir = "aux", -- create a directory called aux that will contain all the auxiliary files
      -- }
    end
  }
}
