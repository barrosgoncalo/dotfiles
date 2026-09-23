return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local keymap = vim.keymap.set

    -- Add current file to the harpoon list
    keymap("n", "<leader>a", function() harpoon:list():add() end,
      { desc = "Harpoon: Add file" })

    -- Toggle the quick-menu (shows/edits/reorders the harpoon list)
    keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: Toggle quick menu" })

    -- Jump directly to file 1-4 (the most common workflow)
    keymap("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: File 1" })
    keymap("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon: File 2" })
    keymap("n", "<C-b>", function() harpoon:list():select(3) end, { desc = "Harpoon: File 3" })
    keymap("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon: File 4" })

    -- Cycle through the list without opening the menu
    keymap("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Prev file" })
    keymap("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
  end,
}
