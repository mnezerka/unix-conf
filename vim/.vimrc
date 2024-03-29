
set t_Co=256

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
let g:omni_sql_no_default_maps = 1

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

" switch spell checker on
" set spell spelllang=en_us

set listchars=trail:@,tab:>-
set list

if has('gui_running')
  set guioptions-=T  " no toolbar
endif

" Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
set confirm

syntax on

" Spilt diff windows vertically
" set diffopt+=vertical

" NERDTree stuff
map <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=40

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" color blueboy
"set background=dark
"colorscheme solarized

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

augroup svelte_ft
  au!
  autocmd BufNewFile,BufRead *.svelte   set syntax=html
augroup END

" automatically open quick fix window after make
autocmd QuickFixCmdPost * nested cwindow | redraw!

" Show syntax highlighting group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set wildignore+=*/.git/*,*/tmp/*,*/node_modules/*,*/vendor/*,*.so,*.swp,*.zip,*pyc

set modelines=3

autocmd BufRead,BufNewFile   *.go setlocal ts=4 sw=4 noexpandtab autoindent

let g:markdown_folding = 1

