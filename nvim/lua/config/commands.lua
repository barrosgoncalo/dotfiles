local scratch_file = vim.fn.stdpath("data") .. "/.scratch"
local ft_file = vim.fn.stdpath("data") .. "/.scratch_ft"

vim.api.nvim_create_user_command("Scratch", function(opts)
    vim.fn.mkdir(vim.fn.fnamemodify(scratch_file, ":h"), "p")
    vim.cmd("edit " .. vim.fn.fnameescape(scratch_file))

    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false

    if opts.args ~= "" then
        vim.bo.filetype = opts.args
        vim.fn.writefile({ opts.args }, ft_file)
    elseif vim.fn.filereadable(ft_file) == 1 then
        local ft = vim.fn.readfile(ft_file)[1]
        if ft and ft ~= "" then
            vim.bo.filetype = ft
        end
    end
end, {
    nargs = "?",
    complete = "filetype",
})

vim.api.nvim_create_user_command("Reveal", function()
    local path = vim.fn.expand("%:p")
    if path == "" then
        vim.notify("No file to reveal", vim.log.levels.WARN)
        return
    end
    vim.fn.system({ "open", "-R", path })
end, {})
