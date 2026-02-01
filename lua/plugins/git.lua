return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup {
            --signs on left side
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable = true,

            --blame for author & last edit details
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                --show blame at end of line
                virt_text_pos = 'eol',
                delay = 100,
                ignore_whitespace = true,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        }
    end
}
