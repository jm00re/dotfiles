"Vundle Shit
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating' 

Bundle 'ervandew/supertab'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'goldfeld/vim-seek'
Bundle 'wellle/targets.vim' 
Bundle 'koron/nyancat-vim' 
Bundle 'triglav/vim-visual-increment' 

Bundle 'molokai'
Bundle 'zenburn'
Bundle 'desert256.vim'
Bundle 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required

"Other Shit
set nobackup
set nowritebackup
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
set incsearch
set ignorecase
set smartcase
set cursorline
set nojoinspaces 
set ttimeout
set ttimeoutlen=100
filetype indent on
filetype on
filetype plugin on
set number
syntax on
set noshowmode
set background=dark
set visualbell
set wrap
set linebreak
"set nosol
set showbreak=&&
set t_Co=16
let g:solarized_visibility = "high"
let g:solarized_termcolors = 16 

colorscheme solarized
"Key Remaps
" Enter add lines in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
cmap <CR> <CR>
cnoremap <CR> <CR>

"j and k move down to the next text
map j gj
map k gk

"Less stupid line movement
map L $
map H ^
map M `

"Buffer Switching
set hidden
map } :bn<cr>
map { :bp<cr>
map <leader>bd :bd<cr>  

"Text Writing
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
endfu 
com! WP call WordProcessorMode()

"File Type Settings
autocmd BufNewFile,BufRead *.txt call WordProcessorMode()  
autocmd BufNewFile,BufRead *.txt set syntax=markdown
autocmd BufRead,BufNewFile *.pde setf java
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
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :q<cr>

"Correct spelling
nnoremap <leader>z 1z=
inoremap <C-f> <esc>[s1z=A
noremap <C-f> <esc>[s1z=A<esc>

"Increment Number
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
vmap <leader>a <C-a>
vmap <leader>x <C-x>

"Cap word
nnoremap <leader>` ve~

"Tmux stuff
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

inoremap <C-h> <C-o>:TmuxNavigateLeft<cr><esc>
inoremap <C-j> <C-o>:TmuxNavigateDown<cr><esc>
inoremap <C-k> <C-o>:TmuxNavigateUp<cr><esc>
inoremap <C-l> <C-o>:TmuxNavigateRight<cr><esc>
"nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
"
"Airline Stuff
"

set laststatus=2

let g:airline_left_sep = ''
let g:airline_left_sep = ''  
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Ack
nnoremap <leader>g :Ack <cword><cr>
