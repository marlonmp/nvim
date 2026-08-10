return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",           -- Package manager for LSP/Linters
        "williamboman/mason-lspconfig.nvim", -- Bridges mason with lspconfig
        "hrsh7th/nvim-cmp",                  -- Completion engine
        "hrsh7th/cmp-nvim-lsp",              -- LSP source for nvim-cmp
        "L3MON4D3/LuaSnip",                  -- Snippet engine
    },
    config = function()
        require("mason").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        -- FIX: Passing handlers directly into setup() instead of calling setup_handlers()
        require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",       -- Lua
            "pyright",      -- Python
            "gopls",        -- Go
            "rust_analyzer",-- Rust
            "ts_ls",        -- JavaScript / TypeScript
            "html",         -- HTML
            "cssls",        -- CSS
            "jsonls",       -- JSON
        },
        handlers = {
            -- The default handler automatically executes for all language servers listed above
            function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities
            })
            end,
        }
        })

        -- Core completion engine behavior and layout
        local cmp = require("cmp")
        cmp.setup({
        snippet = {
            expand = function(args) require("luasnip").lsp_expand(args.body) end
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
        }),
        })

        -- Global keymaps for interacting with language features
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    end,
}
