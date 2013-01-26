" Install pathogen.
execute pathogen#infect()

" Sane C and Python spacing.
augroup c
	autocmd!
	autocmd FileType c setlocal modeline
	autocmd FileType c setlocal autoindent
	autocmd FileType c setlocal cindent
	autocmd FileType c setlocal shiftwidth=4
	autocmd FileType c setlocal tabstop=4
	autocmd FileType c setlocal textwidth=79
	autocmd FileType c setlocal sts=4
augroup end
augroup python
	autocmd!
	autocmd FileType python set sts=4 tabstop=4 sw=4 et ai
	autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup end

" Solarized.
set term=screen-256color
let g:solarized_termcolors=16
set t_Co=16
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

" General rubbish.

set number
