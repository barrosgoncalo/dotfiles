return {

  {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "nvim-lualine/lualine.nvim" },
    priority = 1000 ,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
    -- config = function()
    --   vim.g.gruvbox_contrast_dark = "dark"
    --   require("lualine").setup({
    --     options = {
    --       -- theme = "palenight",
    --       theme = "nightfly",
    --     },
    --   })
    -- end,
  },


  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- These variables MUST be set before the colorscheme command
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material' -- This makes the text look "crisper"
      vim.g.gruvbox_material_enable_italic = 1

      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },


}
