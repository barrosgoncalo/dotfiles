return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- performance booster
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        -- UI enhancement
        'nvim-telescope/telescope-ui-select.nvim',
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
        extensions = {
          ["ui-select"] = {
            themes.get_dropdown(),
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        },
      })
      -- Load BOTH extensions
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')

      -- Keymaps --
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search inside Files" })
      vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {})

      -- Spelling Sugestions
      vim.keymap.set('n', '<leader>z', function()
        builtin.spell_suggest(themes.get_cursor({}))
      end, { desc = "Spelling Suggestions (Telescope)" })
    end

      -- Instant Fix
      -- vim.keymap.set('n', '<C-l>', '1z=', { desc = "Fix with 1st suggestion" })

    -- end
}
