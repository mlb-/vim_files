" augment gf
set suffixesadd=.erl,.htl
set path+=src
" Helpful append mappings
nnore <leader>, m`A,<ESC>``
nnore <leader>; m`A;<ESC>``
nnore <leader>. m`A.<ESC>``
" Omni-complete
inore <C-Space> <C-X><C-O>
" vimerl settings:
let g:erlang_folding = 1
set et
set ts=4
set sw=4
