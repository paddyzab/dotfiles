set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" vundle
Plugin 'gmarik/vundle'
 
" vim go plugin
Plugin 'fatih/vim-go'

" slime 
Plugin 'vim-scripts/slimv.vim'

" nerdtree
Plugin 'scrooloose/nerdtree'
 
" rust
Plugin 'rust-lang/rust.vim'
 
" vim-auto-save
Plugin 'vim-scripts/vim-auto-save'

" vim-arduino
Plugin 'tclem/vim-arduino'

" autocomplete
Plugin 'Shougo/neocomplete.vim'

" print documents in echo area
Plugin 'Shougo/echodoc.vim'

" snippets support
Plugin 'Shougo/neosnippet'

"snippets repository
Plugin 'Shougo/neosnippet-snippets'

" Full path fuzzy finder
Plugin 'kien/ctrlp.vim'

" Gundo for visualising vim undo tree
Plugin 'sjl/gundo.vim'

" Vim-Fugitive
Plugin 'tpope/vim-fugitive'

" Vim-Surround
Plugin 'tpope/vim-surround'

" Vim-Powerline
Plugin 'powerline/powerline'

filetype plugin indent on 
call vundle#end()
