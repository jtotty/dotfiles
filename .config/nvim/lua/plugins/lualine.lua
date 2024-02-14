return {
	"nvim-lualine/lualine.nvim",
	event = "ColorScheme",
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				globalstatus = true,
			},
		})
	end,
}
