"Vundle Shit
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating' 
Bundle 'tpope/vim-markdown' 

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'mileszs/ack.vim'
Bundle 'wellle/targets.vim' 
Bundle 'koron/nyancat-vim' 
Bundle 'triglav/vim-visual-increment' 
Bundle 'bling/vim-bufferline' 
Bundle 'justinmk/vim-sneak' 
Bundle 'sophacles/vim-processing' 
Bundle 'junegunn/goyo.vim' 
Bundle 'Valloric/YouCompleteMe' 

Bundle 'molokai'
Bundle 'zenburn'
Bundle 'inkpot'
Bundle 'desert256.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/base16-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ronny/birds-of-paradise.vim'

call vundle#end()            " required

filetype plugin indent on    " required

" Other Shit
" Why are swap files enabled by default? 
set nobackup
set nowritebackup
set noswapfile
" Smart tab defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Auto indenting
set autoindent
set smarttab
" Case insensitive searching
set incsearch
set ignorecase
set smartcase
" Make backspace work as indented 
set backspace=indent,eol,start
" So Pretty
set cursorline
" Why would I want to add a space when I join a line?
set nojoinspaces 
" Super fast key response times
set ttimeout
set ttimeoutlen=100
" Yes?
set number
" Fixs weird dinging 
set visualbell
" Enable line wrapping and put && at start of linebreak
set wrap
set showbreak=&&
set linebreak
" Doesn't turn long wrapped lines into @s 
set display=lastline
" Switch from unsaved buffers
set hidden
" ooo pretty
syntax on
" Maximum colors
set t_Co=256

colorscheme base16-default

"Key Remaps
" Enter adds lines in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
cmap <CR> <CR>
cnoremap <CR> <CR>

"j and k move down to the next text on wrapped lines
map j gj
map k gk

"I have no clue why this isn't enabled by default
nnoremap Y y$

"Switch the default action of , to \
nnoremap \ ,

"Less stupid line movement
map L $
map H ^

"K breaks lines, J makes more sense"
nnoremap J :join<cr>
map K i<cr><esc>

"Text Writing, copped straight from Dr. Bunsen 
func! WordProcessorMode() 
setlocal formatoptions=1 
setlocal noexpandtab 
setlocal spell spelllang=en_us 
setlocal spell
set complete+=s
set formatprg=par
setlocal wrap 
setlocal linebreak 
setlocal showbreak=
setlocal nocursorline
endfu 
com! WP call WordProcessorMode()

"File Type Settings
autocmd BufEnter,BufNewFile,BufRead *.txt call WordProcessorMode()  
autocmd BufEnter,BufNewFile,BufRead *.txt set syntax=markdown
autocmd BufEnter,BufNewFile,BufRead *.md call WordProcessorMode()  
autocmd BufEnter,BufRead,BufNewFile *.pde setf java
"Remove auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Leader Keys
let mapleader = ','

"Edit .vimrc
nnoremap <leader>ev :split ~/.vimrc<cr>
"Source .vimrc
nnoremap <leader>sv :source ~/.vimrc<cr>
"Fast Saves
nnoremap <leader>w :w<cr>
nnoremap <leader>wa :wa<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>

"Easier pasting from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"Easier wanking to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
vnoremap <leader>y "+y
vnoremap <leader>Y "+y$

"Buffer Management
nnoremap <silent> <leader>bd :bd<CR>  
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <silent> <leader>c :bd<CR>

"Quick spelling correction
nnoremap <leader>z 1z=
inoremap <C-f> <esc>[s1z=gi
nnoremap <C-f> <esc>[s1z=

"Increment Number
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
vmap <leader>a <C-a>
vmap <leader>x <C-x>

"Split windows
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>h :split<cr>

"Make heading
nnoremap <leader>1 I# <esc>
nnoremap <leader>2 I## <esc>
nnoremap <leader>3 I### <esc>
vnoremap <leader>1 I# <esc>
vnoremap <leader>2 I## <esc>
vnoremap <leader>3 I### <esc>

"List
"Command to make ordered lists
command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
vnoremap <silent> <leader>u I* <esc> 
nnoremap <silent> <leader>u I* <esc> 
vnoremap <silent> <leader>o :Number<cr>

" Turn Goyo on, Not sure if I like this. 
nnoremap <silent> <leader>g :Goyo<cr>

"Cap word
nnoremap <leader>` gUw

"Open netrw. 
map <silent> <leader>n :E<cr>

"Tmux stuff
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
inoremap <silent> <C-h> <C-o>:TmuxNavigateLeft<cr><esc>
inoremap <silent> <C-j> <C-o>:TmuxNavigateDown<cr><esc>
inoremap <silent> <C-k> <C-o>:TmuxNavigateUp<cr><esc>
inoremap <silent> <C-l> <C-o>:TmuxNavigateRight<cr><esc>

"Ack
"nnoremap <leader>g :Ack <cword><cr>

"bufferline stuff
set laststatus=2 "always show statusline
let g:bufferline_solo_highlight = 0
let g:bufferline_inactive_highlight = 'StatusLineNC' "No highlighting
let g:bufferline_active_highlight = 'StatusLine' "No highlighting
let g:bufferline_rotate = 0
let g:bufferline_fixed_index = -1 "always first
let g:bufferline_show_bufnr = 0
let g:bufferline_fname_mod = ':t'
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()
"let g:bufferline_active_highlight = 'StatusLine'

"Make netrw look like NerdTREE
let g:netrw_liststyle=3
let g:netrw_banner=0

"Disable folding in vim markdown plugin
let g:vim_markdown_folding_disabled=1
