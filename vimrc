"=========================================================================================
" VIM Configuration
"=========================================================================================
" pathogen configs
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set shell=/bin/bash
set guifont=Monaco:h12
set guioptions-=T


if has("gui_running")
  colorscheme hemingway
  set columns=100
  set lines=90
endif

let mapleader=","

set shiftwidth=2              "number of spaces to use in each autoindent step
set tabstop=2                 "two tab spaces
set softtabstop=2             "number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                 "spaces instead of tabs for better cross-editor compatibility
set autoindent                "keep the indent when creating a new line
set smarttab                  "use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                   "recommended seting for automatic C-style indentation
set autoindent                "automatic indentation in non-C files
set wrap                      "wrap entire words, don't break them; much easier to read!

"set grepprg=ack
"set grepformat=%f:%l:%m

set number

" search
set incsearch
set smartcase
set ignorecase
set nowrap

set nofoldenable
set hidden
set wildmenu


" insert mode should be a little more like textmate
cmap :W :w
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-e> <Esc>A
imap <C-a> <Esc>^i
imap <C-l> <Space>=><Space>
imap jj <Esc>


"editing .vimrc
map <leader>r :tabe ~/.vimrc<CR>
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
end

"opening and closing buffers
noremap <leader>v :botright vs<cr>
noremap <leader>h :sp<cr>
noremap <leader>w :Bclose<cr>
noremap <leader>q :bd<cr>
noremap <leader>f :Ack 

"syntax on

if has("autocmd")
  filetype plugin indent on
endif

autocmd FileType javascript,json set ai sw=4 sts=4 et
autocmd FileType cucumber set ai sw=2 sts=2 et

set backspace=indent,eol,start

"=========================================================================================
" Plugin Configuration
"=========================================================================================
" Command-t
set wildignore+=*.o,*.obj,.git,log/**,vendor/**,*/plugins/*

" Delimit Mate
let delimitMate_expand_cr = 1

" Fugitive
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

" NERDTree
map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>
" find a way to map :NERDTreeFind (how does TM do it?)

" Tlist
map <leader>T :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_WinWidth=55

" Match IT
runtime! macros/matchit.vim
