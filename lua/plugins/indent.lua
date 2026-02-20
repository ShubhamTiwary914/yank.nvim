return {
    "nvimdev/indentmini.nvim",
    cmd = { 'IndentToggle', 'IndentEnable', 'IndentDisable' },
    keys = {
        {'<F5>', '<Cmd>IndentToggle<CR>', desc = 'Toggle indent guides'},
    },
    lazy = false,
    config = function()
        require("indentmini").setup({
            -- only_current = false,
            enabled = true,
			chat = '| ',
            minlevel = 2,
            exclude = { 'text' }
        })
        vim.cmd("IndentEnable")

        vim.cmd.highlight('IndentLine guifg=#9783c3')
        vim.cmd.highlight('IndentLineCurrent guifg=#5e703f')
    end

}
