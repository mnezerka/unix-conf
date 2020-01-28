" Vim color file
" Maintainer: michal.nezerka@gmail.com	

"set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "blueboy"

hi Normal		guifg=#e0e0e0 guibg=#333333 ctermfg=246 ctermbg=none
hi ErrorMsg		ctermfg=white ctermbg=lightblue
hi Visual		ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS	ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo			ctermfg=226 ctermbg=none
hi Search		ctermfg=white ctermbg=darkblue cterm=underline term=underline
hi IncSearch	ctermfg=darkblue ctermbg=gray

hi SpecialKey	ctermfg=darkcyan
hi Directory	ctermfg=39
hi Title		ctermfg=251 cterm=bold
hi WarningMsg	ctermfg=red
hi WildMenu		ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg		ctermfg=lightblue
hi MoreMsg		ctermfg=darkgreen
hi Question		ctermfg=green cterm=none
hi NonText		ctermfg=darkblue

hi StatusLine	ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC	ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit	ctermfg=black ctermbg=gray term=none cterm=none

hi Folded	    ctermfg=94 ctermbg=none
hi FoldColumn	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	    ctermfg=240

hi DiffAdd	    ctermfg=250 ctermbg=22 cterm=none
hi DiffChange	ctermfg=250 ctermbg=24 cterm=none
hi DiffDelete	ctermfg=250 ctermbg=88 cterm=none
hi DiffText     ctermfg=227 ctermbg=238 cterm=none

hi Cursor	    ctermfg=black ctermbg=yellow
hi lCursor	    ctermfg=black ctermbg=white

hi Comment      guifg=#ffe066 ctermfg=24
hi Constant     guifg=#ffe066 ctermfg=35 cterm=none
hi Special      ctermfg=brown cterm=none
hi Identifier	ctermfg=39  cterm=none
hi Statement	ctermfg=221 cterm=none 
hi PreProc  	ctermfg=207 cterm=none
hi type	    	ctermfg=41 cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore   	ctermfg=yellow ctermbg=none

hi VertSplit    ctermfg=25 ctermbg=none
