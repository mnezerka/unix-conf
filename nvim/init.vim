
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
Plug 'ray-x/starry.nvim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" golang
" Plug 'neovim/nvim-lspconfig'
" Plug 'ray-x/go.nvim'
" Plug 'ray-x/guihua.lua'

call plug#end()


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
lua require('starry.functions').change_style("mariana")

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
