return {
    'stevearc/conform.nvim',
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        -- TODO: Add more formatters
        formatters_by_ft = {
            lua = { 'stylua' },
            go = { 'goimports-reviser', 'gofumpt' },
            javascript = { 'prettierd' },
            vue = { 'prettierd' },
        },
    },
}
