local M = {}

local enabled = false

local arrow_keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
local modes = { "n", "i", "v" }

local function map_arrows(disabled)
    for _, mode in ipairs(modes) do
        for _, key in ipairs(arrow_keys) do
            vim.keymap.set(mode, key, disabled and "<Nop>" or key, {
                noremap = true,
                desc = "Professor mode arrow keys",
            })
        end
    end
end

function M.set(value)
    enabled = value

    if enabled then
        map_arrows(false)

        vim.keymap.set("n", "<C-d>", "<C-d>", { noremap = true })
        vim.keymap.set("n", "<C-u>", "<C-u>", { noremap = true })
    else
        map_arrows(true)

        vim.keymap.set("n", "<C-d>", "2<C-d>", { noremap = true })
        vim.keymap.set("n", "<C-u>", "2<C-u>", { noremap = true })
    end

    print("Professor mode " .. (enabled and "enabled" or "disabled"))
end

function M.toggle()
    M.set(not enabled)
end

function M.is_enabled()
    return enabled
end

-- Apply the default configuration on startup.
M.set(false)

return M

