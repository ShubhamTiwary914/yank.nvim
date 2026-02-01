local lspConfigs = function ()
    vim.lsp.config['lua_ls'] = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
    }
    vim.lsp.enable('lua_ls')

    vim.lsp.config['typescript_ls'] = {
        cmd = {'typescript_language-server'},
        filetypes = {'ts'},
    } 
    vim.lsp.enable('typescript_ls')


    vim.lsp.config['python_ls'] = {
        cmd = {'python-lsp-server'},
        filetypes = {'py'},
    }
    vim.lsp.enable('python_ls')


    vim.lsp.config['bash_ls'] = {
        cmd = {'bash-language-server'},
        filetypes = {'sh'},
    }
    vim.lsp.enable('bash_ls')
end


return {
   --mason for downloading LSP servers, Lint, Formatter, ..
    {
        "mason-org/mason.nvim",
    }, 
    --connects mason & LSP config
    -- :LspInfo for LSP list & logs
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls" },
            }
        end
    },
    -- LSP config for neovim
    -- LSP servers list: https://neovim.io/doc/user/lsp.html#lsp-quickstart 
    -- How to config: https://neovim.io/doc/user/lsp.html#lsp-quickstart
    -- Check status, logs for LSP -> :LspInfo
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set('n','hh', vim.lsp.buf.hover, {}) -- hover info details
            vim.keymap.set('n','hj', vim.lsp.buf.implementation, {}) -- goto implementation 
            vim.keymap.set('n','hg', vim.lsp.buf.code_action, {}) -- suggestions on fixes (via treesitter-select)
            lspConfigs()
        end
    }
}
