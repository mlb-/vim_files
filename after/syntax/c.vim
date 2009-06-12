

function! ProgRun(...)
	update
	let e = 0
	let ext = expand("%:e")
	if ext == "c" && getftime(expand("%:r")) < getftime(expand("%"))
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
set makeprg=gcc\ -std=c99\ -o\ %:r\ %
"set errorformat=%f:%l:%v:%*\\d:%*\\d:%*\\s%m

command! -nargs=* Run call ProgRun(<f-args>)

if maparg("<F6>") == ""
	map <F6> :!ctags -u %<CR>
endif

if maparg("<F5>") == ""
	map <F5> :Run<CR>
endif

"call IMAP('<+pattern+>','<+replacement+>','<+filetype+>')


call IMAP('inc<','#include <<++>><++>','c')
call IMAP('iout','#include <stdio.h>','c')
call IMAP('imain','int main(){<+block+>s	return 0;}<++>','c')

call IMAP('if()', 'if(<++>)<++>', 'c')
call IMAP('while()', 'while(<++>)<++>', 'c')
call IMAP('for()','for(<+vars+>;<+condition+>;<+command+>)<++>','c')

call IMAP('{}', '{<++>}<++>', 'c')

call IMAP('()', '(<++>)<++>', 'c')
call IMAP('[]', '[<++>]<++>', 'c')
call IMAP('""', '"<++>"<++>', 'c')
call IMAP('<>', '<<++>><++>', 'c')

"

