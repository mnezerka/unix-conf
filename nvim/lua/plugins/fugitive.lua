return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gread" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff Split" },
  },
}
