
" jg3 version 202303 stolen bits from various places
" 

" Get the Vim color scheme file from this guy: https://ethanschoonover.com/solarized/ and put it where it goes:
"  mkdir -p ~/.vim/colors/
"  wget  https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim -P  ~/.vim/colors/.

" Color scheme (terminal)
set t_Co=256
#set background=light
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" the next line lets your terminal's background color show through;
" wich is great if it's black but probably conflicts with syntax highlighting otherwise
"let g:solarized_termtrans=1


set number
set paste

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
