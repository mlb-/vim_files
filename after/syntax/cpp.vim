
map <Down> <ESC>:Tlist<CR>
map <Up> <ESC>:copen<CR>
map <F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

function! ProgRun(...)
	update
	let e = 0
	let ext = expand("%:e")
	if ext == "cpp" && getftime(expand("%:r")) < getftime(expand("%"))
		make
		let e = v:shell_error
	endif
	if e == 0
		let idx = 1
		let arg = ""
		while idx <= a:0
			execute "let a = a:" . idx
			let arg = arg . ' ' . a
			let idx = idx + 1
		endwhile
		cd %:p:h
		execute "! time ./".expand("%:r") . " " . arg
		cd -
	endif
endfunction


set shellpipe=>\ %s\ 2>&1
" set makeprg=make
set makeprg=g++\ -o\ %:r\ %
"set errorformat=%f:%l:%v:%*\\d:%*\\d:%*\\s%m

command! -nargs=* Run call ProgRun(<f-args>)

if maparg("<F6>") == ""
	map <F6> :!ctags -u %<CR>
endif

if maparg("<F5>") == ""
	map <F5> :Run<CR>
endif

"call IMAP('<+pattern+>','<+replacement+>','<+filetype+>')

call IMAP('#inc','#include <<++>><++>','cpp')

call IMAP('inc<','#include <<++>><++>','cpp')
call IMAP('iout','#include <iostream>using namespace std;','cpp')
call IMAP('imain','int main(){<+block+>s	return 0;}<++>','cpp')

call IMAP('if()', 'if(<++>)<++>', 'cpp')
call IMAP('while()', 'while(<++>)<++>', 'cpp')
call IMAP('for()','for(<+vars+>;<+condition+>;<+command+>)<++>','cpp')

call IMAP('{}', '{<++>}<++>', 'cpp')

call IMAP('()', '(<++>)<++>', 'cpp')
call IMAP('[]', '[<++>]<++>', 'cpp')
call IMAP('""', '"<++>"<++>', 'cpp')
call IMAP('<>', '<<++>><++>', 'cpp')

"

