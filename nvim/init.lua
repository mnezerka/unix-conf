require("config.lazy")

vim.keymap.set('n', '<F12>',     ':NvimTreeToggle<CR>', { noremap = true })

-- disable mouse because of troubles with clipboard on macos and tmux
vim.o.mouse = false

-- global options
vim.o.wildmenu =  true
vim.o.wildignore = '*/.git/*,*/tmp/*,*/node_modules/*,*/vendor/*,*.so,*.swp,*.zip,*pyc'
vim.o.listchars = 'trail:@,tab:>-'
vim.o.list = true
vim.o.smarttab = true


-- buffer options
-- Set the tabstop and shiftwidth options to 4
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.smartindent = true
vim.bo.expandtab = true


-- window options
vim.wo.number = true
vim.wo.foldmethod = 'indent'

-- setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})

