return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                --Linting 
                --Formatting
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettier,
            },
        })
    end
}
