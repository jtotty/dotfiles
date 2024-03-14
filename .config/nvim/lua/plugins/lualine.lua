return {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    config = function()
        require('lualine').setup {
            options = {
                globalstatus = true,
                theme = 'auto',
                section_separators = '',
                component_separators = '',
            },
        }
    end,
}
