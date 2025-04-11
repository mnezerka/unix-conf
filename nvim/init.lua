require("config.lazy")

-- redefine Leader key
vim.g.mapleader = ' '


-- nvim tree open/close on F12
vim.keymap.set('n', '<F12>',     ':NvimTreeToggle<CR>', { noremap = true })

-- disable mouse because of troubles with clipboard on macos and tmux
-- vim.o.mouse = 'todo'

-- global options
vim.opt.wildmenu =  true
vim.opt.wildignore = { '*/.git/*', '*/tmp/*', '*/node_modules/*', '*/vendor/*', '*.so', '*.swp' , '*.zip' , '*pyc' }
vim.opt.listchars = { trail = '@', tab = '>-' }
vim.opt.list = true
vim.opt.smarttab = true

-- buffer options
-- Set the tabstop and shiftwidth options to 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.expandtab = true


-- window options
vim.wo.number = true
vim.wo.foldmethod = 'indent'

-- setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fc', builtin.current_buffer_fuzzy_find, {})

