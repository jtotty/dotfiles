return {
	"norcalli/nvim-colorizer.lua",
	config = function()
        settings = {
            css = true,
            css_fn = true,
            mode = 'background',
        }

		require("colorizer").setup({
            scss = settings,
            css = settings,
            html = settings,
            javascript = settings,
        })
	end,
}
