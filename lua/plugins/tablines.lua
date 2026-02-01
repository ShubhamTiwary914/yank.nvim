return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', 
      'nvim-tree/nvim-web-devicons', 
    },
    init = function() 
        vim.g.barbar_auto_setup = true 
    end,
    opts = {
        animation = true
    },
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        --jump with Alt+<num> to buffer 
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

        -- move left/right between buffers
        map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)
        -- shift buffer position left/right 
        map('n', '<A-S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<A-S-Right>', '<Cmd>BufferMoveNext<CR>', opts)

        -- Close buffer 
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

        require'barbar'.setup {
            tabpages = true,
            icons = {
                buffer_index = true,
                buffer_number = false,
                button = '',
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
                    [vim.diagnostic.severity.WARN] = {enabled = false},
                    [vim.diagnostic.severity.INFO] = {enabled = false},
                    [vim.diagnostic.severity.HINT] = {enabled = true},
                },
            },
            gitsigns = {
                added = {enabled = true, icon = '+'},
                changed = {enabled = true, icon = '~'},
                deleted = {enabled = true, icon = '-'},
            },
            modified = {button = '●'},
            pinned = {button = '', filename = true},
        }
    end
}
