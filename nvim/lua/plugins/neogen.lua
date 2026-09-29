return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("neogen").setup({})
    end,
    keys = {
        {
            "<leader>jd",
            function()
                require("neogen").generate()
            end,
            desc = "Generate Javadoc (Neogen)",
        },
    },
}
