return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        local no_really = {
            method = null_ls.methods.DIAGNOSTICS,
            filetypes = { "markdown", "text" },
            generator = {
                fn = function(params)
                    local diagnostics = {}

                    for i, line in ipairs(params.content) do
                        local col, end_col = line:find("really")
                        if col and end_col then
                            table.insert(diagnostics, {
                                row = i,
                                col = col,
                                end_col = end_col + 1,
                                source = "no-really",
                                message = "Don't use 'really!'",
                                severity = vim.diagnostic.severity.WARN,
                            })
                        end
                    end

                    return diagnostics
                end,
            },
        }

        null_ls.setup({
            sources = {
                -- ESLint (from extras)
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.code_actions.eslint_d"),

                -- Formatting
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier,
            },
        })

        null_ls.register(no_really)
    end,
}

