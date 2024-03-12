return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        -- Define icons for diagnostic errors
        vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
        vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
        vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
        vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

        require('neo-tree').setup {
            close_if_last_window = false,
            buffers = {
                follow_current_file = { enabled = true },
            },
            filesystem = {
                follow_current_file = { enabled = true },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            popup_border_style = 'rounded',
            enable_git_statuts = true,
            enable_diagnostics = true,
            default_component_configs = {
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '󰜌',
                    -- Fallback if nvim-web-devicons not available
                    default = '*',
                    highlight = 'NeoTreeFileIcon',
                },
            },
        }

        vim.keymap.set('n', '<C-f>', ':Neotree filesystem reveal left<CR>', {})
        vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
    end,
}
