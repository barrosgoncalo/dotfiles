return {
    -- ==============================================================================
    -- (Note: '\' assumes your <localleader> is set to the backslash key)
    -- ==============================================================================

    {
        "lervag/vimtex",
        lazy = false,
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            vim.g.vimtex_view_method = "skim"
            -- manage build auxiliary folders
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                    '-shell-escape',
                },
                executable = 'latexmk',
                hooks = {},
            }
        end
    }
    -- ==============================================================================
    -- VimTeX Keybindings Quick Reference
    -- ==============================================================================
    -- \ll (Start/Stop Compilation)
    -- \lv (View PDF)
    -- \le (Errors)
    -- \lc (Clean)
    -- \li (Info)
}
