return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
    }
  end,
}


