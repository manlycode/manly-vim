"=========================================================================================
" VIM Configuration
"=========================================================================================
" pathogen configs
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set shell=/bin/bash
set guifont=Monaco:h12
set guioptions-=T

let mapleader=","

set ts=2 sts=2 sw=2 expandtab

"set autoindent
"set smarttab
"set cindent
"set wrap

set grepprg=ack
set grepformat=%f:%l:%m

set number

" search
set incsearch
set smartcase
set ignorecase
set nowrap

set nofoldenable
set hidden
set wildmenu

set columns=140
set lines=90

" insert mode should be a little more like textmate
cmap :W :w
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-e> <Esc>A
imap <C-a> <Esc>^i
imap <C-l> <Space>=><Space>


"editing .vimrc
map <leader>r :tabe ~/.vimrc<CR>
map <silent> <leader>R :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
end

"opening and closing buffers
:noremap <leader>v :botright vs<cr>
:noremap <leader>h :sp<cr>
:noremap <leader>w :Bclose<cr>
:noremap <leader>q :bd<cr>
:noremap <leader>f :Ack 

syntax on
if has("autocmd")
  filetype plugin indent on
endif


colorscheme hemingway
"=========================================================================================
" Plugin Configuration
"=========================================================================================

"Fugitive
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'} " filetype
set statusline+=]
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"NERDTree
map <leader>d :execute 'NERDTreeToggle ' .getcwd()<CR>
" find a way to map :NERDTreeFind (how does TM do it?)
