return	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function ()
        local neotree = require('neo-tree.command')
        vim.keymap.set("n", "<leader>e", function() neotree.execute({ toggle = true, position = "left" }) end)
        vim.keymap.set("n", "<leader>ec", function() neotree.execute({ action = "close" }) end)
        vim.keymap.set("n", "<leader>b", function() neotree.execute({ source = "buffers", toggle = true, position="right" }) end)

        require("neo-tree").setup({
            -- preview mode while browsing on neotree (similar to live grep) 
            window = {
                mappings = {
                    ["p"] = { "toggle_preview" },
                    ["l"] = "focus_preview",
                }
            },
            enable_git_status = true,
            enable_diagnostics = true,
            preview = {
                enabled = true,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                },
            },
    })
    end
}

