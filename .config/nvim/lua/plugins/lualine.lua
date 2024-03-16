return {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    config = function()
        require('lualine').setup {
            options = {
                theme = 'tokyonight',
                globalstatus = false,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                ignore_focus = { 'neo-tree' },
            },
        }
    end,
}
