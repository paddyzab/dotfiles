" backup settings
set nobackup
set nowb
set noswapfile

" Height of the command bar
set cmdheight=2

" Always show current position
set ruler

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show line numbers
set number        

" Use syntax highlighting
syntax enable     
"""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""
colorscheme desert
set background=dark
let g:solarized_termcolors=256
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Use Unix as the standard file type
set ffs=unix,dos,mac

set nocompatible
filetype off    " Required
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" automatically open NERDTree in start
autocmd vimenter * NERDTree

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
" Remember info about open buffers on close
set viminfo^=%

" enable AutoSave on Vim startup
let g:auto_save = 1  

" do not save while in insert mode
let g:auto_save_in_insert_mode = 0  

set rtp+=~/.vim/vundle.vim/
call vundle#rc()

" vundle
Bundle 'gmarik/vundle'

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

filetype plugin indent on " Required
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

"""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""
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
