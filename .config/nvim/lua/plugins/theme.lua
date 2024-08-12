return {
    -- {
    --     'folke/tokyonight.nvim',
    --     lazy = false, -- make sure it's loaded during startup
    --     priority = 1000, -- make sure to load before all the other start plugins
    --     config = function()
    --         require('tokyonight').setup {
    --             style = 'night',
    --             transparent = false,
    --             dim_inactive = false,
    --             styles = {
    --                 sidesbars = 'dark',
    --                 floats = 'dark',
    --             },
    --             sidebars = { 'neo-tree' },
    --             lualine_bold = true,
    --         }
    --
    --         vim.cmd.colorscheme 'tokyonight'
    --     end,
    -- },
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('cyberdream').setup {
                borderless_telescope = false,
                extensions = {
                    telescope = true,
                    notify = true,
                },
            }

            vim.cmd.colorscheme 'cyberdream'
        end,
    },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('nordic').setup {
    --             bold_keywords = true,
    --             transparent_bg = true,
    --         }
    --
    --         vim.cmd.colorscheme 'nordic'
    --     end,
    -- },
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
