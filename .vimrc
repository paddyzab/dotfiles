" backup settings
set backup  
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" Solarised theme settings:
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

set nocompatible
filetype off    " Required

set rtp+=~/.vim/vundle.vim/
call vundle#rc()

" vundle
Bundle 'gmarik/vundle'

" solarised theme
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on " Required
