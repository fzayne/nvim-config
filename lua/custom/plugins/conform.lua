return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                php = { "pint", "php_cs_fixer" },
                blade = { "blade_formatter" },
                lua = { "stylua" },
                -- Add other filetype formatters
            },
            format_on_save = {
                timeout_ms = 2500,
                lsp_fallback = true,
            },
            formatters = {
                pint = {
                    command = "pint",
                    args = { "--quiet" },
                    stdin = true,
                },
                blade_formatter = {
                    command = "blade-formatter",
                    args = { "--stdin" },
                    stdin = true,
                },
                php_cs_fixer = {
                    command = "php-cs-fixer",
                    args = { "fix", "--rules=@PSR12", "--using-cache=no", "-" },
                    stdin = true,
                }
            }
        })
    end
}
