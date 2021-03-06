" Launch Config {{{
set spell spelllang=en_US
set nocompatible
filetype off
source ~/.vim/.vundleconf.vim " Load Vundle configuration
" }}}
" Leader Config {{{
let mapleader=","

" reopen previously opened file
nnoremap <Leader><Leader> :e#<CR>

" reload VIM config
map <leader>s :source ~/.vimrc<CR>

" redraw the current vim window
nnoremap <leader>m :silent make\|redraw!\|cw<CR>

" open Tree
nnoremap <leader>w :NERDTreeToggle<CR>

" Locate current file in Tree
nmap <leader>j :NERDTreeFind<CR>

" open fold
nnoremap <leader>f za

" open Gundo
nnoremap <leader>u :GundoToggle<CR>

" Toggle autosave
nnoremap <leader>h :A<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
inoremap jk <esc>
nnoremap <leader>r :call RunTestFile()<CR>
nnoremap <leader>g :call RunGoFile()<CR>
nnoremap <space> :
" }}}
" Backup Settings {{{
set nobackup
set nowb
set noswapfile
" }}}
" Tabs Settings {{{
set tabstop=2     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set cmdheight=2   " Height of the command bar
set ruler         " Always show current position
set number        " Show line numbers
set showcmd       " Show command in bottom bar
set cursorline    " Highlight current line
set wildmenu      " Visual autocomplete for command menu
set showmatch     " highlights matching [{()}]
syntax enable     " Use syntax highlighting
set ai            " Auto indent
set si            " Smart indent
set wrap          " Wrap lines
set colorcolumn=90
" }}}
" Search {{{
set hlsearch      " Highlight search results
set incsearch     " Makes search act like search in modern browsers
" }}}
" Folding {{{
"=== folding ===
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=indent " fold based on indent level
" }}}
" Colors and Fonts {{{
" Use 256 colours
set t_Co=256
set background=dark
set encoding=utf8             " Set utf8 as standard encoding and en_US as the standard language
colorscheme badwolf
let g:badwolf_darkgutter = 1  " Make the gutters darker than the background.
let g:badwolf_tabline = 0     " Make the tab line darker than the background.
" }}}
" Status line {{{
set laststatus=2              " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set ffs=unix,dos,mac          " Use Unix as the standard file type
" }}}
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" }}}
" NERDTree settings {{{
autocmd vimenter * NERDTree   " automatically open NERDTree in start
let g:NERDTreeWinSize = 40
let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
" }}}
" Powerline settings {{{
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
" }}}
" Vim-GO {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}
" Code {{{
let g:neocomplete#enable_at_startup = 1
nnoremap <leader>l :TagbarToggle<CR>
" remove white spaces on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}
" Helper functions {{{
   autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
    set viminfo^=%                     " Remember info about open buffers on close
    let g:auto_save = 1                " Enable AutoSave on Vim startup
    let g:auto_save_in_insert_mode = 0 " do not save while in insert mode

    filetype plugin indent on " Required
    autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

     function! CmdLine(str)
         exe "menu Foo.Bar :" . a:str
             emenu Foo.Bar
                 unmenu Foo
                 endfunction

    function! VisualSelection(direction) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", '\\/.*$^~[]')
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'b'
            execute "normal ?" . l:pattern . "^M"
        elseif a:direction == 'gv'
            call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        elseif a:direction == 'f'
            execute "normal /" . l:pattern . "^M"
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    " Returns true if paste mode is enabled
    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction

    " Don't close window, when deleting a buffer
    command! Bclose call <SID>BufcloseCloseIt()
    function! <SID>BufcloseCloseIt()
       let l:currentBufNum = bufnr("%")
       let l:alternateBufNum = bufnr("#")

       if buflisted(l:alternateBufNum)
         buffer #
       else
         bnext
       endif

       if bufnr("%") == l:currentBufNum
         new
       endif

       if buflisted(l:currentBufNum)
         execute("bdelete! ".l:currentBufNum)
       endif
    endfunction

    " Close all open buffers on entering a window if the only
    " buffer that's left is the NERDTree buffer
    function! s:CloseIfOnlyNerdTreeLeft()
      if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
          if winnr("$") == 1
            q
          endif
        endif
      endif
    endfunction
    " }}}

" vim:foldmethod=marker:foldlevel=0
