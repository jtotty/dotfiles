return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        -- see `:help nvim-treesitter`

        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'vim',
                'vimdoc',
                'gitignore',
                'markdown',
                'html',
                'css',
                'scss',
                'lua',
                'go',
                'rust',
                'php',
                'vue',
                'yaml',
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
