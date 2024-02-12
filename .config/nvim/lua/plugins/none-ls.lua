return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- JS / TS
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.eslint_d,

                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,

                -- PHP
                -- null_ls.builtins.formatting.phpcs_fixer,
                null_ls.builtins.diagnostics.phpstan,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
