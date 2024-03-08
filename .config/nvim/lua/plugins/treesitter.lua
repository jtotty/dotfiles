return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    opts = {
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
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['if'] = '@function.inner',
                    ['af'] = '@function.outer',
                    ['ia'] = '@parameter.inner',
                    ['aa'] = '@parameter.outer',
                },
            },
        },
    },
    config = function(_, opts)
        -- see `:help nvim-treesitter`
        require('nvim-treesitter.configs').setup(opts)

        -- NOTE: Laravel Blade workaround, might not work
        local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

        ---@diagnostic disable-next-line: inject-field
        parser_config.blade = {
            install_info = {
                url = 'https://github.com/EmranMR/tree-sitter-blade',
                files = { 'src/parser.c' },
                branch = 'main',
            },
            filetype = 'blade',
        }

        vim.filetype.add {
            pattern = {
                ['.*%.blade%.php'] = 'blade',
            },
        }
    end,
}
