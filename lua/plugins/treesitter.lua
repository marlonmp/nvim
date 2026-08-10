return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
        ensure_installed = {
            "lua", "vim", "vimdoc", "python", "go", "rust",
            "javascript", "typescript", "html", "css", "json"
        },
        highlight = { enable = true },
        })
    end,
}
