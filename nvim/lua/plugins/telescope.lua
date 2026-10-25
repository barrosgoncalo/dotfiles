return {
    'nvim-telescope/telescope.nvim', version = '*',
    event = 'VeryLazy', -- so ui-select is active before the first prompt
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find Files' },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Search inside Files' },
        { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Find Buffers' },
        { '<leader>z',
        function()
            require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({}))
        end,
        desc = 'Spelling Suggestions (Telescope)' },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local themes = require('telescope.themes')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                    n = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                },
            },
            extensions = {
                ['ui-select'] = { themes.get_dropdown() },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')
    end,
}
