return {
    {
        'folke/tokyonight.nvim',
        lazy = false, -- make sure it's loaded during startup
        priority = 1000, -- make sure to load befoer all the other start plugins
        config = function()
            require('tokyonight').setup {
                style = 'night',
                transparent = false,
                dim_inactive = false,
                styles = {
                    sidesbars = 'dark',
                    floats = 'dark',
                },
                sidebars = { 'neo-tree' },
                lualine_bold = true,
            }

            vim.cmd.colorscheme 'tokyonight'
        end,
    },
    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            signs = false,
        },
    },
}
