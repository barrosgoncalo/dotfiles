return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local api = require("nvim-tree.api")

      local function on_attach(bufnr)
        -- Load nvim-tree's default mappings
        api.map.on_attach.default(bufnr)

        -- Reveal the selected file or directory in Finder
        vim.keymap.set("n", "gx", function()
          local node = api.tree.get_node_under_cursor()

          if not node or not node.absolute_path then
            return
          end

          if node.type == "file" then
            vim.fn.jobstart({ "open", "-R", node.absolute_path }, {
              detach = true,
            })
          else
            vim.fn.jobstart({ "open", node.absolute_path }, {
              detach = true,
            })
          end
        end, {
          buffer = bufnr,
          silent = true,
          noremap = true,
          desc = "Reveal in Finder",
        })
      end

      require("nvim-tree").setup({
        on_attach = on_attach,

        view = {
          width = 30,
        },

        renderer = {
          group_empty = true,
        },

        filters = {
          dotfiles = false,
          custom = {
            "\\.class$",
            "\\.iml$",
            "\\.DS_Store",
            "^out$",
            "^target$",
            "^%.idea$",
          },
          exclude = {},
        },
      })

      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", {
        silent = true,
        desc = "Toggle nvim-tree",
      })
    end,
  },
}
