" Vimrc of Matthew Batema

" Vundle! {{{
  filetype off
  set runtimepath+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
" }}}
" Initialize {{{
  " Set for windows compatability {{{
    if has('win32') || has('win64')
      set runtimepath+=~/.vim,~/.vim/after
    endif
  " }}}
  let mapleader=","
  set nocompatible  " Not compatible with vi -- vim, fuck yeah!
  syntax on
  filetype plugin indent on
" }}}
" Look and feel -- otherwise it doesn't look "right" {{{
  " Color schemes {{{
    set t_Co=256
    if has('gui_running')
      Bundle 'jnurmine/Zenburn'
      colorscheme zenburn
    else
      Bundle 'tpope/vim-vividchalk'
      colorscheme vividchalk
      set background=light
    endif
  " }}}
  " statusline {{{
    " Always display statusline
    set laststatus=2
    " Powerline!
    Bundle 'Lokaltog/vim-powerline'
    " Prepare for the eventual deprecation of vim-powerline. Either move to
    " something lighter-weight such as airline, or use the heavy successor to
    " vim-powerline: powerline.
    "" airline!
    "Bundle 'bling/vim-airline'
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
  set ignorecase  " Use case insensitive matching
  set smartcase   " ...except when term contains capital letters
  set gdefault    " Assume global behaviour on substitutions - append /g to undo
  set incsearch   " highlight while entering search terms (incrementally)
  set hlsearch
  " Show count of / results
  Bundle 'IndexedSearch'
" }}}
" Standard settings {{{
  " UI {{{
    set showcmd   " show partial commands
    set cmdheight=2
    set ruler   " show cursor location
    "set number     " absolute line numbers
    set relativenumber  " relative line numbers

    set showtabline=2 " Display tabbar even if empty
    set scrolloff=1   " lines of context for when at top/bottom of window
    " Toggle colorcolumn on insert, if available {{{
      if exists('+colorcolumn')
        augroup colorcolumn
          au!
          autocmd InsertEnter * set colorcolumn=+1
          autocmd InsertLeave * set colorcolumn=
        augroup END
      endif
    " }}}

    set encoding=utf-8

    set ttyfast   " because we don't live in the good ol' 9600 baud days
    set lazyredraw    " redraw screen after work happens

    set cursorline    " underline which line cursor is on
    set cursorcolumn  " underline which column cursor is on
    set showmatch   " highlight matching % when on cursor's on one

    set confirm   " Yes Vista, I am sure.

    " abbreviate various messages
    set shortmess=aI
    " always report number of lines changed
    set report=0

    set noerrorbells    " silence those fucking bells
    set guioptions-=T   " No toolbar
  " }}}
  " Text formatting {{{
    " formatting options {{{
      set formatoptions-=t    " Don't attempt to format text
      set formatoptions+=n    " attempt to recognize numbered lists
      set formatoptions+=l    " Don't break a line in insert mode if already >textwidth
      if v:version > 703 || v:version == 703 && has("patch550")
        set formatoptions+=j    " Attempt to strip leading comment when using j
      endif
      augroup formattext
        au!
        autocmd FileType text,gitcommit,markdown setl formatoptions+=ta " autoformat text
        autocmd FileType text,gitcommit,markdown setl formatoptions-=croq " not code
        autocmd FileType gitcommit setl spell textwidth=72
        autocmd FileType text,markdown setl spell textwidth=78
      augroup END
    " }}}
    set noet    " no expand tab
    " I like smaller indents now.
    set ts=2
    set sw=2
    set autoindent    " carry previous line's indent on ^M
    set smartindent   " auto-indent on {, } and keywords
    set backspace=2
  " }}}
  " Behaviour {{{
    set modeline
    " Wildmenu {{{
      set wildmenu    " show list of : commands
      set wildmenu
      set wildmode=list:full
      set wildmode="list:longest" " default was "full"

      set wildignore+=.hg,.git,.svn,CVS
      set wildignore+=*.aux,*.out,*.toc
      set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
      set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
      set wildignore+=*.spl
      set wildignore+=*.sw?
      set wildignore+=*.DS_Store
      set wildignore+=*.luac
      set wildignore+=migrations
      set wildignore+=*.pyc
      set wildignore+=*.beam
    " }}}
    set mouse=a   " mouse support
    set mousehide
    set grepprg=grep\ -nH\ $*
    " Wrap to prev/next line when navigating with hl of hjkl/arrow keys
    set whichwrap+=<,>,h,l
  " }}}
" }}}
" Autocmd: {{{
  augroup vimrcEx
    au!

    " Strip trailing whitespace before saving
    autocmd BufWritePre * :%s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

    " ensure every file does syntax highlighting (full)
    autocmd BufEnter * :syntax sync fromstart

    " Equally resize windows on vim window resize
    autocmd VimResized * exe "normal! \<c-w>="

  augroup END
" }}}
" Keybindings {{{
  map <down> gj
  map <up> gk
" }}}

cmap w!! %!sudo tee > /dev/null %

" {{{ Markdown
  " syntax files
  Bundle 'tpope/vim-markdown'
" }}}
" Erlang {{{
  Bundle 'jimenezrick/vimerl'
  " See ~/.vim/ftplugin/erlang.vim
" }}}
" Clojure {{{
  Bundle 'tpope/vim-leiningen'
  Bundle 'tpope/vim-projectionist'
  Bundle 'tpope/vim-dispatch'
  Bundle 'tpope/vim-fireplace'
  Bundle 'guns/vim-clojure-static'
  Bundle 'guns/vim-clojure-highlight'
  Bundle 'guns/vim-sexp'
  Bundle 'tpope/vim-sexp-mappings-for-regular-people'
" }}}
" Git! {{{
  Bundle 'tpope/vim-fugitive'
  " Cleanup fugitive buffers
  augroup fugitive_bufclean
    au!
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufReadPost fugitive://*
          \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
          \   nnoremap <buffer> .. :edit %:h<CR> |
          \ endif
  augroup END
" }}}
" LaTeX-suite (disabled) {{{
  if 0
  Bundle 'gerw/vim-latex-suite'
  let g:Tex_DefaultTargetFormat="pdf"
  if has('mac') || has('macunix')
    let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app/'
  endif
  let g:Tex_CompileRule_pdf =  'pdflatex -shell-escape -interaction=nonstopmode $*'
  endif
" }}}
" Syntastic! {{{
  Bundle 'scrooloose/syntastic'
  let g:syntastic_auto_loc_list=1
" }}}
" Tagbar! {{{
  Bundle 'majutsushi/tagbar'
  let g:tagbar_ctags_bin = '/usr/bin/ctags'
  " let g:tagbar_type_javascript = {
  "       \ 'ctagsbin' : '/usr/bin/jsctags'
  "       \ }
  let g:tagbar_sort = 0
  "let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'
  nnoremap <silent> <F7> :TagbarToggle<CR>
" }}}
" Tmux support {{{
  Bundle 'ervandew/screen'
  let g:ScreenImpl = 'Tmux'
" }}}

" Miscellaneous vundles: {{{

  " re/un/wrap manipulation
  Bundle 'tpope/vim-surround'
  " Extend bracket mappings
  Bundle 'tpope/vim-unimpaired'
  " FS tree nav
  Bundle 'scrooloose/nerdtree'
  nnoremap <silent> <C-n> :NERDTreeToggle<CR>

  " Buffer nav
  Bundle 'jeetsukumaran/vim-buffergator'
  " Let ^A/^X work on date/timestamps
  Bundle 'tpope/vim-speeddating'
  Bundle 'kien/rainbow_parentheses.vim'
	au VimEnter * RainbowParenthesesToggleAll
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
	au Syntax * RainbowParenthesesLoadChevrons

  " Enable repeating various other tpope (surround, speeddating, abolish,
  " unimpaired) with .
  Bundle 'tpope/vim-repeat'
  " Handle editing images where imagemagick is available
  Bundle 'tpope/vim-afterimage'
  " Pastie support
  Bundle 'tpope/vim-pastie'
  " Maximize gvim windows automatically
  if has('win32')
    Bundle 'maximize.dll'
  endif

  " Probationary plugins:
  " Tabular!
  Bundle 'godlygeek/tabular'
  Bundle 'vim-scripts/YankRing.vim'
  "Fuzzy match file opening
  Bundle 'kien/ctrlp.vim'
  Bundle 'mhinz/vim-signify'
  Bundle 'tpope/vim-characterize'
" }}}

" vim: set fdm=marker et:
