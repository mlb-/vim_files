compiler perl

"call IMAP('<+pattern+>','<+replacement+>','<+filetype+>')


call IMAP('{}', '{<++>}<++>', 'perl')

call IMAP('()', '(<++>)<++>', 'perl')
call IMAP('[]', '[<++>]<++>', 'perl')
call IMAP('<>', '<<++>><++>', 'perl')

"
au FileType perl setlocal keywordprg=perldoc\ -T\ -f
