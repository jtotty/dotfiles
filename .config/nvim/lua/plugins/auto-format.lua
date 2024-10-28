return {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 1000,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            go = { 'goimports-reviser', 'gofumpt' },
            php = { 'php' },
            html = { 'prettierd' },
            css = { 'prettierd' },
            json = { 'prettierd' },
            javascript = { 'prettierd' },
            javascriptreact = { 'prettierd' },
            typescript = { 'prettierd' },
            typescriptreact = { 'prettierd' },
            vue = { 'prettierd' },
            blade = { 'blade-formatter' },
            ruby = { 'rubocop' },
        },
        -- Custom formatters
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
