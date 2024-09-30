
" ---- installation of plugin manager plug.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ---- configuration of plugin manager plug.vim
call plug#begin()

" git
Plug 'tpope/vim-fugitive'

" bottom line
Plug 'bling/vim-airline'

" syntax checking
Plug 'dense-analysis/ale'

Plug 'majutsushi/tagbar'

" searching
Plug 'kien/ctrlp.vim'

" file system tree
Plug 'preservim/nerdtree'
"Plug 'nvim-tree/nvim-tree.lua'

" neovim color schemes
"Plug 'ray-x/starry.nvim'
Plug 'sthendev/mariana.vim', {'run': 'make'}

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lsp
Plug 'neovim/nvim-lspconfig'

" telescope and it's dependences
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" golang
" Plug 'neovim/nvim-lspconfig'
" Plug 'ray-x/go.nvim'
" Plug 'ray-x/guihua.lua'

" auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

"vim.opt.completeopt={ "menu", "menuone", "noselect" }

" disable mouse because of troubles with clipboard on macos and tmux
set mouse=

set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set smartindent

set foldmethod=indent

set nowrap
set wildmenu
set nohlsearch
set number

set listchars=trail:@,tab:>-
set list

set wildignore+=*/.git/*,*/tmp/*,*/node_modules/*,*/vendor/*,*.so,*.swp,*.zip,*pyc

" disable background of starry colorscheme
" let starry_disable_background = v:true

" alternative is colorscheme mariana
" lua require('starry.functions').change_style("mariana")

" ---- NERDTree stuff
map <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40

" ---- golang stuff
" run gofmt on save
" (https://stackoverflow.com/questions/72135274/run-gofmt-on-vim-without-plugin)
function! GoFmt()
    let saved_view = winsaveview()
    silent %!gofmt
    if v:shell_error > 0
        cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
        silent undo
"        cwindow
    endif
    call winrestview(saved_view)
endfunction

command! GoFmt call GoFmt()

augroup go_autocmd
  autocmd BufWritePre *.go GoFmt
augroup END

lua <<EOF

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end


local cmp = require('cmp')

cmp.setup({

  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})


local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- setup languages 
-- GoLang
nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  -- on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}

-- setup telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
EOF
