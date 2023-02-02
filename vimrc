if has("gui_running")
    set guifont=Monospace\ 10
    set lines=50
    set columns=100
    colorscheme desert
endif

set list
set nowrap
set background=dark
set laststatus=2
set nomousehide
set expandtab
set tabstop=4
set shiftwidth=4
set diffopt+=vertical
set relativenumber
set number

syntax on

if has("mouse")
    set mouse=a
endif

function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>


" change diff colorscheme
hi DiffAdd    gui=none guifg=#69ff47 guibg=NONE
hi DiffChange gui=none guifg=skyblue1 guibg=NONE
hi DiffDelete gui=bold guifg=#ff0000 guibg=NONE
hi DiffText   gui=none guifg=#000000 guibg=hotpink1

" for cool git things
execute pathogen#infect()

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" load startify
Plug 'mhinz/vim-startify'

" load goyo
Plug 'junegunn/goyo.vim'

" load lightline
Plug 'itchyny/lightline.vim'

" load vim-gitbranch
Plug 'itchyny/vim-gitbranch'

" load vim gitgutter
Plug 'airblade/vim-gitgutter'

" load nercdommenter
Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-obsession'

Plug 'tmux-plugins/vim-tmux'

" Initialize plugin system
call plug#end()

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" increase update time so vim-gitgutter can update quicker
set updatetime=100
let g:gitgutter_max_signs = 1000

" enable filetyp plugin for nerdcommenter
filetype plugin on

" auto remove trailing spaces
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.ksh :%s/\s\+$//e
autocmd BufWritePre *.sh :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.yml :%s/\s\+$//e
autocmd BufWritePre *.yaml :%s/\s\+$//e
autocmd BufWritePre *.pcpp :%s/\s\+$//e

" set filetype detection
au BufRead,BufNewFile *.wiz setfiletype sslang
au BufRead,BufNewFile *.mod setfiletype sslang
au BufRead,BufNewFile *.slang setfiletype sslang
au BufRead,BufNewFile *.skl setfiletype sslang
au BufRead,BufNewFile *.mac setfiletype smart
au BufRead,BufNewFile *.pcpp setfiletype cpp

map <F9> :Fs<CR>
map <F10> :set expandtab <CR> :retab<CR>
" move through files
map <F11> :bp <CR>
map <F12> :bn <CR>
map <F8> :%s/\s\+$//e <CR>


" Settings for taglist plugin.  Note that something like 
" au BufNewFile,BufRead *.pcpp set filetype=cpp
" is necessary to make taglist work for .pcpp files.
"
" You'll also need to include '--langmap=c++:+.pcpp' in your ~/.ctags file.
"
map <F6> :Tlist
let Tlist_Sort_Type = "name"
let Tlist_Show_One_File = 1

