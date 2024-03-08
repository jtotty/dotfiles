return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
        require('ibl').setup {
            debounce = 300,
            indent = { char = '·' },
            exclude = {
                filetypes = {
                    'lspinfo',
                    'packer',
                    'checkhealth',
                    'help',
                    'man',
                    'gitcommit',
                    'TelescopePrompt',
                    'TelescopeResults',
                    'dashboard',
                    '',
                },
                buftypes = {
                    'terminal',
                    'neo-tree',
                },
            },
        }
    end,
}
