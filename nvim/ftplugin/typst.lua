-- e.g. in config/filetype-specific keymaps for typst
local typst_job = nil
vim.keymap.set("n", "<localleader>ll", function()
    if typst_job then
        vim.fn.jobstop(typst_job)
        typst_job = nil
        vim.notify("typst watch stopped")
        return
    end
    local file = vim.fn.expand("%:p")
    typst_job = vim.fn.jobstart({ "typst", "watch", file }, {
        on_exit = function() typst_job = nil end,
    })
    vim.fn.jobstart({ "open", "-a", "Skim", vim.fn.expand("%:p:r") .. ".pdf" })
    vim.notify("typst watch started")
end, { buffer = true, desc = "Toggle typst watch" })
