return {
    -- Main Colour Theme
    {
        'folke/tokyonight.nvim',
        lazy = false, -- make sure it's loaded during startup
        priority = 1000, -- make sure to load befoer all the other start plugins
        config = function()
            vim.cmd.colorscheme 'tokyonight-night'

            vim.cmd.hi 'Comment gui=none'
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
