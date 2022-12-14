-- local formatting = require("modules.completion.formatting")

vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd nvim-navic]])

local nvim_lsp = require("lspconfig")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup()
mason_lsp.setup({
    ensure_installed = {
        "lua-language-server",
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local function custom_attach(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        floating_window = true,
        fix_pos = true,
        hint_enable = false,
        hi_parameter = "Search",
        handler_opts = {
            border = "rounded"
        },
    })
    require("nvim-navic").attach(client, bufnr)
end

-- Override server settings here

for _, server in ipairs(mason_lsp.get_installed_servers()) do
    if server == "sumneko_lua" then
        nvim_lsp.sumneko_lua.setup({
            capabilities = capabilities,
            on_attach = custom_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim", "packer_plugins" } },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                    telemetry = { enable = false },
                },
            },
        })
    elseif server == "jsonls" then
        nvim_lsp.jsonls.setup({
            flags = { debounce_text_changes = 500 },
            capabilities = capabilities,
            on_attach = custom_attach,
            settings = {
                json = {
                    -- Schemas https://www.schemastore.org
                    schemas = {
                        {
                            fileMatch = { "package.json" },
                            url = "https://json.schemastore.org/package.json",
                        },
                        {
                            fileMatch = { "tsconfig*.json" },
                            url = "https://json.schemastore.org/tsconfig.json",
                        },
                        {
                            fileMatch = {
                                ".prettierrc",
                                ".prettierrc.json",
                                "prettier.config.json",
                            },
                            url = "https://json.schemastore.org/prettierrc.json",
                        },
                        {
                            fileMatch = { ".eslintrc", ".eslintrc.json" },
                            url = "https://json.schemastore.org/eslintrc.json",
                        },
                        {
                            fileMatch = {
                                ".babelrc",
                                ".babelrc.json",
                                "babel.config.json",
                            },
                            url = "https://json.schemastore.org/babelrc.json",
                        },
                        {
                            fileMatch = { "lerna.json" },
                            url = "https://json.schemastore.org/lerna.json",
                        },
                        {
                            fileMatch = {
                                ".stylelintrc",
                                ".stylelintrc.json",
                                "stylelint.config.json",
                            },
                            url = "http://json.schemastore.org/stylelintrc.json",
                        },
                        {
                            fileMatch = { "/.github/workflows/*" },
                            url = "https://json.schemastore.org/github-workflow.json",
                        },
                    },
                },
            },
        })
    else
        nvim_lsp[server].setup({
            capabilities = capabilities,
            on_attach = custom_attach,
        })
    end
end
