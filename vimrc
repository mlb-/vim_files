" Vimrc of Matthew Batema

" Vundle! {{{
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" }}}
" Initialize {{{
	" Set for windows compatability {{{
	if has('win32')
		set runtimepath+=~/.vim,~/.vim/after
	endif
	" }}}
	let mapleader=","
	set nocompatible	" Not compatible with vi -- vim, fuck yeah!
	syntax on
	filetype plugin indent on
" }}}
" Look and feel -- otherwise it doesn't look "right" {{{
	" Color schemes {{{
	if has('gui_running')
		Bundle 'jnurmine/Zenburn'
		colorscheme zenburn
	else
		Bundle 'tpope/vim-vividchalk'
		set background="dark"
		colorscheme vividchalk
	endif
	" }}}
	" statusline {{{
	" Always display statusline
	set laststatus=2
	" Powerline!
	Bundle 'Lokaltog/vim-powerline'
	" Retired statusline (I have powerline)
	"set statusline=%n:%F\ %m%y%=%l/%L,\ %c%V\ %P
	" }}}
	" Set font (on windows){{{
	if has('gui_running')
		let g:Powerline_symbols = 'fancy'
		if has('win32')
			"set guifont=Lucida_Console:h9:cANSI
			set guifont=Anonymous_Pro_for_Powerline:h11
		endif
	endif
	" }}}
" }}}
" Vimrc edit & reload {{{
    nno <leader>Ve :tabedit $MYVIMRC<CR>
    nno <leader>Vr :source $MYVIMRC<CR>
" }}}
" Search settings {{{
" \v prefix makes use of perl-style regexps
nnoremap / /\v
" use selection to search with
vmap / y/<C-R>"<CR>
set ignorecase	" Use case insensitive matching
set smartcase		" ...except when term contains capital letters
set gdefault		" Assume global behaviour on substitutions - append /g to undo
"set hlsearch		" highlight results
"set incsearch		" highlight while entering search terms (incrementally)
" Show count of / results
Bundle 'IndexedSearch'
" }}}
" re/un/wrap manipulation
Bundle 'tpope/vim-surround'

set encoding=utf-8
set scrolloff=1		" lines of context for when at top/bottom of window

set colorcolumn=85	" Show me when I go too far right

"set nu			" absolute line numbers
set relativenumber	" relative line numbers

" I like smaller indents now.
set ts=2
set sw=2
set autoindent		" carry previous line's indent on ^M
set smartindent		" auto-indent on {, } and keywords

set showcmd		" show partial commands
set wildmenu		" show list of : commands
set wildmode="list:longest"	" default was "full"
set cursorline		" underline which line cursor is on
set cursorcolumn	" underline which column cursor is on
set ttyfast		" because we don't live in the good ol' 9600 baud days

set ruler		" show cursor location
set showmatch		" highlight matching % when on cursor's on one

set modeline
set modelines=5		" good shit
set history=5		" keep 50 lines of command line history
set mouse=a		" mouse support
set backspace=2
set grepprg=grep\ -nH\ $*
set showtabline=2

set confirm		" Yes Vista, I am sure.
set cmdheight=2
set lazyredraw		" redraw screen after work happens
set whichwrap+=<,>,h,l
set shortmess=aI
set report=0
set noeb		" silence those fucking bells
set fo=tcrqn		" formatting opts
set noet		" no expand tab
set guioptions-=T


set t_Co=256


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


" vim: set fdm=marker:
