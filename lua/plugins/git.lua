return {
    -- 1. real-time git signs & file change tracking
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signcolumn = true,
            numhl = false,
            linehl = false,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 100,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "      <author> • <author_time:%R> • <summary>",
            signs = {
                add          = { text = "┃" },
                change       = { text = "┃" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },
        },
        keys = {
            -- git change in file (navigate or inspect line changes)
            { "]c",         function() require("gitsigns").next_hunk() end,    desc = "Next Git Change" },
            { "[c",         function() require("gitsigns").prev_hunk() end,    desc = "Previous Git Change" },
            { "<leader>gc", function() require("gitsigns").preview_hunk() end, desc = "Git Change in File (Preview Hunk)" },
        },
    },

    -- 2. full-screen git console dashboard
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
        keys = {
            -- git status
            { "<leader>gs", "<cmd>Neogit<CR>",        desc = "Git Status Panel" },

            -- git commit
            { "<leader>gC", "<cmd>Neogit commit<CR>", desc = "Git Commit Changes" },

            -- git branch (checkout branch)
            { "<leader>gb", "<cmd>Neogit branch<CR>", desc = "Git Branch (Checkout/Create)" },

            -- git pull
            { "<leader>gl", "<cmd>Neogit pull<CR>",   desc = "Git Pull (Fetch & Merge)" },

            -- git push
            { "<leader>gp", "<cmd>Neogit push<CR>",   desc = "Git Push to Remote" },
        },
    },
}
