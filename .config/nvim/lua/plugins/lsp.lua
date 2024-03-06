-- Language Server Protocol setup.
-- A protocal that helps editors and language tooling communicate in a standardised fashion.
--
-- You have a "server" (such as gopls, rust_analyzer, tsserver) that understands a particular language.
-- The servers communicate with a "client" (Neovim, VSCode)
--
-- LSP provides Neovim with features like:
--  - Go to definition
--  - Find references
--  - Autocompletion
--  - Symbol Search
--  - and more!
-- Thus, Language Servers are external tools that must be installed separately from
-- Neovim. This is where `mason` and related plugins come into play.
--
-- LSP vs TreeSitter - `:help lsp-vs-treesitter`
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        -- Runs when the LSP attaches to a particular buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- We create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Jump to the definition of the word under your cursor.
                -- To jump back, press <C-T>.
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                -- Find references for the word under your cursor.
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                -- Jump to the implementation of the word under your cursor.
                -- Useful when your language has ways of declaring types without an actual implementation.
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                -- Jump to the type of the word under your cursor.
                -- The definition of its *type*, not where it was *defined*.
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                -- Fuzzy find all the symbols in your current document.
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                -- Fuzzy find all the symbols in your current workspace
                -- Similar to document symbols, except searches over your whole project.
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                -- Rename the variable under your cursor
                -- Most Language Servers support renaming across files, etc.
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                -- Show the floating error information box.
                map('<leader>e', vim.diagnostic.open_float, '[E]rror Diagnostics')

                -- Opens a popup that displays documentation about the word under your cursor
                -- See `:help K` for why this keymap
                map('K', vim.lsp.buf.hover, 'Hover Documentation')

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                -- For example, in C this would take you to the header
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end,
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        -- By default, Neovim doesn't support everything that is in the LSP Specification.
        -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local lspconfig = require 'lspconfig'

        -- Used for the Vue Volar lsp setup
        local function get_typescript_server_path(root_dir)
            local project_root = lspconfig.util.find_node_modules_ancestor(root_dir)
            return project_root and (lspconfig.util.path.join(project_root, 'node_modules', 'typescript', 'lib')) or ''
        end

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            -- Where to find the Lua files loaded for the neovim configuration
                            library = {
                                '${3rd}/luv/library',
                                unpack(vim.api.nvim_get_runtime_file('', true)),
                            },
                            -- If lua_ls is really slow on your computer, you can try this instead:
                            -- library = { vim.env.VIMRUNTIME },
                        },
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
            gopls = {
                cmd = { 'gopls' },
                root_dir = lspconfig.util.root_pattern('go.work', 'go.mod', '.git'),
                filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
                settings = {
                    gopls = {
                        completeUnimported = true, -- Auto import packages when we use auto-complete
                        usePlaceholders = true, -- Adds parameters and fiels automatically
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            },
            tailwindcss = {},
            tsserver = {},
            cssls = {
                settings = {
                    -- Tailwind @apply rule
                    css = { validate = true, lint = { unknownAtRules = 'ignore' } },
                    scss = { validate = true, lint = { unknownAtRules = 'ignore' } },
                    vue = { validate = true, lint = { unknownAtRules = 'ignore' } },
                },
            },
            html = {},
            volar = {
                -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/volar.lua
                cmd = { 'vue-language-server', '--stdio' },
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
                root_dir = lspconfig.util.root_pattern 'package.json',
                init_options = {
                    typescript = {
                        tsdk = '',
                    },
                },
                -- Takeover Mode
                on_new_config = function(new_config, new_root_dir)
                    if new_config.init_options and new_config.init_options.typescript and new_config.init_options.typescript.tsdk == '' then
                        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
                    end
                end,
            },
        }

        require('mason').setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
            'tailwindcss-language-server',
            'typescript-language-server',
            'vue-language-server',
            'css-lsp',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for tsserver)
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    lspconfig[server_name].setup(server)
                end,
            },
        }
    end,
}
