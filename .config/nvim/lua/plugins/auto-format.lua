return {
    'stevearc/conform.nvim',
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            go = { 'goimports-reviser', 'gofumpt' },
            php = { 'php' },
            javascript = { 'prettierd' },
            vue = { 'prettierd' },
        },
        formatters = {
            php = {
                command = 'php-cs-fixer',
                args = {
                    'fix',
                    '$FILENAME',
                    '--config=/home/james/.config/php-cs-fixer/config.php',
                },
                stdin = false,
            },
        },
    },
}
