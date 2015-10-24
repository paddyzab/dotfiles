" Launch Config {{{
set nocompatible
filetype off 
source ~/.vim/.vundleconf.vim " Load Vundle configuration
" }}}
" Backup Settings {{{
set nobackup
set nowb
set noswapfile
" }}}
" Tabs Settings {{{
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing 
set expandtab     " tabs are spaces
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
nnoremap <space> za 
set foldmethod=indent " fold based on indent level
" }}}
" Colors and Fonts {{{
colorscheme badwolf
set background=dark
set encoding=utf8             " Set utf8 as standard encoding and en_US as the standard language
let g:badwolf_darkgutter = 1  " Make the gutters darker than the background.
let g:badwolf_tabline = 0     " Make the tab line darker than the background.
" }}}
" Status line {{{
set laststatus=2              " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set ffs=unix,dos,mac          " Use Unix as the standard file type
" }}}
" NERDTree settings {{{
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree   " automatically open NERDTree in start
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
