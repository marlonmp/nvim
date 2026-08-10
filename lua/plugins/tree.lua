return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            view = {
                number = true,         -- enables line numbers
                relativenumber = true, -- makes them relative
            },
            renderer = {
                root_folder_label = function(path)
                    return "[" .. vim.fn.fnamemodify(path, ":t") .. "]"
                end,
            },
            actions = {
                open_file = {
                    quit_on_open = true, -- closes the tree window after opening a file
                },
            },
        })
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    end,
}
