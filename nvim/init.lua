-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Leader Key (must be set before lazy.setup)
-- ----------------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- BOOTSTRAP Lazy.nvim
-- ----------------------------------------------------------------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Plugins
-- ----------------------------------------------------------------------------------------------------------------------------------------------
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function(ev)
        vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(ev.buf) then return end
            vim.api.nvim_buf_call(ev.buf, function()
                vim.fn["vimtex#init"]()
                vim.cmd("runtime! indent/tex.vim")
            end)
        end)
    end,
})

-- ----------------------------------------------------------------------------------------------------------------------------------------------
-- Core Config
-- ----------------------------------------------------------------------------------------------------------------------------------------------
require("config.options")
require("config.keymaps")
require("config.filetype")
require("config.commands")
require("config.env")

-- Theme (needs colorscheme loaded via lazy first, so after plugins setup)
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
