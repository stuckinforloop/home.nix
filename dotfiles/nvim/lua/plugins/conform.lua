return {
    {
        "stevearc/conform.nvim",
        opts = {},
        config = function()
            require("conform").setup({
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
                formatters_by_ft = {
                    go = { "golangci-lint", "goimports", "gofumpt", lsp_format = "fallback" },
                    lua = { "stylua" },
                    python = { "ruff" },
                    rust = { "rustfmt", lsp_format = "fallback" },
                },
            })
        end,
    },
}
