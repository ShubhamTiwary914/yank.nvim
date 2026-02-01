return	{
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter'.install {'javascript', 'lua'}
    end
}

