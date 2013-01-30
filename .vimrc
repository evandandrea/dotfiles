" Install pathogen.
execute pathogen#infect()

syntax on

" Sensible defaults.
set ai et sts=4 tabstop=4 sw=4 tw=79

" Line numbers for quickly jumping around.
set number
"
" Jump back to the matching bracket briefly.
set showmatch

set incsearch
" Highlight all search matches
set hlsearch
" Clear the highlighted search matches on enter
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Forgot to open as root.
cmap w!! w !sudo tee % >/dev/null

" Solarized.
set term=screen-256color
let g:solarized_termcolors=16
set t_Co=16
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
