return	
{
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function()
            local tel = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', tel.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', tel.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', tel.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', tel.help_tags, { desc = 'Telescope help tags' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim', 
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}

