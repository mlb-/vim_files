
set nocompatible	" vim, fuck yeah!
set nu			" line numbers
set ai			" autoindent
set si			" smartindent
set showmatch		" highlight matching % when on cursor's on one
set nohls		" Don't highlight results
set is			" highlight while searching
set ruler		" show cursor location
set showcmd		" show partial commands
set modeline
set modelines=5		" good shit
set history=5		" keep 50 lines of command line history
set mouse=a		" mouse support
set backspace=2
set grepprg=grep\ -nH\ $*
set showtabline=2

set cf			" Confirm shit.
set cmdheight=2
set lz			" lazy redraw
set whichwrap+=<,>,h,l
set shortmess=aI
set report=0
set noeb		" silence those fucking bells
set fo=tcrqn		" formatting opts
set noet		" no expand tab
set guioptions-=T


set t_Co=256

colo elflord
syntax on

" Force reloading of filetype
filetype off
call pathogen#helptags() 
call pathogen#runtime_append_all_bundles() 

filetype on
filetype plugin on
filetype indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
augroup END

function! SuperRetab(width) range
	silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction

let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app/'

let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)

map <down> gj
map <up> gk
" right arrow (normal mode) brings up the buffer list
map <right> <ESC>\mbe
map <F2> <ESC>ggVG:call SuperRetab()<left>

" strip trailing spaces
nmap \w :%s/[\t ]\+$//g

let g:Tex_CompileRule_pdf =  'pdflatex -shell-escape -interaction=nonstopmode $*'

" vi:fdm=indent
