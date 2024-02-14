return {
	--[[
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = false,
        })

        vim.cmd.colorscheme "tokyonight-night"
    end,
    ]]
	--
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "main",
			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}
