
local lspConfigs = function ()
    vim.lsp.config['lua_ls'] = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
    }
    vim.lsp.enable('lua_ls')

    vim.lsp.config['python_ls'] = {
        cmd = {'pyright'},
        filetypes = {'py'},
    }
    vim.lsp.enable('python_ls')

    vim.lsp.config['bash_ls'] = {
        cmd = {'bash-language-server'},
        filetypes = {'sh'},
    }
    vim.lsp.enable('bash_ls')

    vim.lsp.config['javascript_ls'] = {
        cmd = {'quick-lint-js'},
        filetypes = {'js'},
    }
    vim.lsp.enable('javascript_ls')

    vim.lsp.config['typescript_ls'] = {
        cmd = {'typescript_language-server'},
        filetypes = {'ts'},
    }
    vim.lsp.enable('typescript_ls')

    vim.lsp.config['jsts_ls'] = {
        cmd = {'oxlint'},
        filetypes = {'js'},
    }
    vim.lsp.enable('jsts_ls')

    vim.lsp.config['golang_ls'] = {
        cmd = {'gopls'},
        filetypes = {'go'},
    }
    vim.lsp.enable('golang_ls')

    vim.lsp.config['docker_ls'] = {
        cmd = {'docker-language-server'},
        filetypes = {'Dockerfile', 'yml', 'yaml'},
    }
    vim.lsp.enable('docker_ls')

	vim.lsp.config['clangd'] = {
		cmd = {'clangd', '--query-driver=**'},
		filetypes = {'c', 'cpp', 'c++', 'h'},
	}
	vim.lsp.enable("clangd")

	vim.lsp.config['terraformls'] = {
		cmd = { 'terraform-ls', 'serve' },
		filetypes = { 'terraform', 'terraform-vars', 'tf', 'tf-vars'},
		root_markers = { '.terraform', '.git', 'main.tf' },
	}
	vim.lsp.enable('terraformls')
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
			vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
				config = config or {}
				config.border = "rounded"
				return vim.lsp.handlers.hover(err, result, ctx, config)
			end

			vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
				config = config or {}
				config.border = "rounded"
				return vim.lsp.handlers.signature_help(err, result, ctx, config)
			end

			vim.keymap.set('n', 'hh', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'hj', vim.lsp.buf.implementation, {})
			vim.keymap.set('n', 'hg', vim.lsp.buf.code_action, {})

			lspConfigs()

			vim.diagnostic.config({
				float = { border = "rounded" },
				virtual_text = {
					prefix = '■ ',
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end
    }
}
