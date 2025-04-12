return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    ---@type lualine.config
    opts = { theme = 'onedark' },

    config = function(_, opts)
        require('lualine').setup(opts)
    end,
}
