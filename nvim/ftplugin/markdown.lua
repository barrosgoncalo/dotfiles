local buf = vim.api.nvim_get_current_buf()
local group = nil

vim.keymap.set("n", "<localleader>ll", function()
    if group then
        vim.api.nvim_del_augroup_by_id(group)
        group = nil
        vim.notify("markdown auto-compile stopped")
        return
    end

    local file = vim.fn.expand("%:p")
    local pdf = vim.fn.expand("%:p:r") .. ".pdf"
    local function compile(open)
            vim.system({ "pandoc", file, "-o", pdf, "--pdf-engine=typst", "-V", "mainfont=Libertinus Serif" }, {}, function(res)
            vim.schedule(function()
                if res.code ~= 0 then
                    vim.notify(res.stderr, vim.log.levels.ERROR)
                elseif open then
                    vim.system({ "open", "-a", "Skim", pdf })
                end
            end)
        end)
    end

    group = vim.api.nvim_create_augroup("markdown_pdf_" .. buf, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = group,
        buffer = buf,
        callback = function() compile(false) end,
    })
    compile(true)
    vim.notify("markdown auto-compile started")
end, { buffer = true, desc = "Toggle markdown -> PDF on save" })
