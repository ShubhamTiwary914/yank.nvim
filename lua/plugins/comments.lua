return {
    {
        -- toggler for commenting
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup({
                padding = true, 
                mappings = {
                    basic = true,
                    extra = true
                }
            })
            -- line toggle comment 
            local api = require("Comment.api")
            vim.keymap.set("n", "11", api.toggle.linewise.current)
        end 
    },
    {
        --highlights for TODO, WARNING, BUG, NOTE, etc... comments 
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = true,
            keywords = {
                FIX = { icon = " ", color = "error",  alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" , alt={"LATER"} },
                HACK = { icon = " ", color = "warning" , alt={"DANGER", "UNSAFE"} },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "PASS", "FAILED", "FAIL" } },
            },
            colors = {
                error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                info = { "DiagnosticInfo", "#2563EB" },
                hint = { "DiagnosticHint", "#10B981" },
                default = { "Identifier", "#7C3AED" },
                test = { "Identifier", "#FF00FF" }
            },
        }
    }
}
