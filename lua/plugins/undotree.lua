return {
  "mbbill/undotree",
  -- Keymaps specific to undotree
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
  },
  config = function()
    -- Optional: Auto-focus the undotree window when opened
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
