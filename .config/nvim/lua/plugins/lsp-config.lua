return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"gopls", -- Go
					"rust_analyzer", -- Rust
					"tsserver", -- JS/TS
					"html",
					"cssls",
					"dockerls",
					"intelephense", -- PHP
					"volar", -- Vue
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			-- HTML & CSS
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })

			-- JS/TS
			lspconfig.tsserver.setup({ capabilities = capabilities })

			-- Vue 3
			lspconfig.volar.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "vue", "json" },
			})

			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Rust
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })

			-- PHP Laravel
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = { "php", "blade" },
				settings = {
					intelephense = {
						filetypes = { "php", "blade" },
						files = {
							associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
							maxSize = 5000000,
						},
					},
				},
			})

			-- Golang
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
}
