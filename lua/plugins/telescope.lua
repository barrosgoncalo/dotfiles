return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local builtin = require('telescope.builtin')
      local themes = require('telescope.themes')
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      telescope.setup({
        defaults = {
          mappings = {
            i = { -- "i" for Insert mode (where you type to filter)
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = { -- "n" for Normal mode
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search inside Files" })
      vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {})

      -- Dropdown list
      vim.keymap.set('n', '<leader>z', function()
        builtin.spell_suggest(themes.get_cursor({}))
      end, { desc = "Spelling Suggestions (Telescope)" })

      -- Instant Fix
      -- vim.keymap.set('n', '<C-l>', '1z=', { desc = "Fix with 1st suggestion" })

    end
  },
}
