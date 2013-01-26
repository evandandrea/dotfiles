" Install pathogen.
execute pathogen#infect()

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
let vala_space_errors = 1
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
set background=dark
syntax enable

au! BufRead,BufNewFile *.moin set filetype=moin
filetype on
filetype plugin on
filetype plugin indent on
"nnoremap <space> za
"vnoremap <space> zf
"set foldmethod=indent

" Sane tab-complete.
set wildmode=longest,list,full
set wildmenu

" Include underscores when tabbing.
set iskeyword-=_

" Save marks between sessions.
set viminfo='1000,f1,<500

set modeline

" Solarized
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
