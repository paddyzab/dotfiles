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

" autocomplete
Plugin 'Shougo/neocomplete.vim'

" tagbar
Plugin 'majutsushi/tagbar'

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

" Im-sexp-mappings-for-regular-people
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" Rainbow
Plugin 'luochen1990/rainbow'

" Gutter - shows diff in the gutter
Plugin 'airblade/vim-gitgutter'

" Vim syntax file for Docker's Dockerfile and snippets for snipMate.
Plugin 'ekalinin/Dockerfile.vim'

filetype plugin indent on
call vundle#end()
