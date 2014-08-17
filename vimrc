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
Bundle 'mileszs/ack.vim'
Bundle 'wellle/targets.vim' 
Bundle 'koron/nyancat-vim' 
Bundle 'triglav/vim-visual-increment' 
Bundle 'scrooloose/nerdtree' 
"Bundle 'vim-scripts/buftabs' 
Bundle 'bling/vim-bufferline' 
Bundle 'justinmk/vim-sneak' 

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
filetype plugin indent on
set number
syntax on
set noshowmode
set background=dark
set visualbell
set wrap
set linebreak
set number
"set nosol
set showbreak=&&
set t_Co=16
let g:solarized_visibility = "high"
let g:solarized_termcolors = 16 

colorscheme solarized
"Dirty colorscheme hack
highlight Normal ctermfg=None ctermbg=Black

"Key Remaps
" Enter add lines in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
cmap <CR> <CR>
cnoremap <CR> <CR>

"j and k move down to the next text
map j gj
map k gk

"Make Y make sense
nnoremap Y y$

"I smashed , to remapped to \
nnoremap \ ,

"Less stupid line movement
map L $
map H ^
map M `

"Buffer Switching
set hidden
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

"Split windows
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

"Make heading
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

"Period Seperated List to MD style list
nnoremap <leader>ul $xI*<space><esc>:s/\./\r\*/g<cr>
nnoremap <leader>ol $xI1<space><esc>:s/\./\r\1/g<cr>

"Cap word
nnoremap <leader>` gUw

"Open NERDtree
map <leader>n :NERDTreeToggle<CR>

"Close NERDtree after file open
let NERDTreeQuitOnOpen = 1
"Close buffer
nnoremap <leader>d :bd<CR>

"Arrows to change buffers
nnoremap <left> :bprev<CR>
nnoremap <right> :bnext<CR>
nnoremap <leader>c :bd<CR>



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

"Buftabs Stuff
"let g:buftabs_in_statusline=1
"let g:buftabs_only_basename=1
"let g:airline_left_sep = ''
"let g:airline_left_sep = ''  
"let g:airline_right_sep = ''
"let g:airline_right_sep = ''
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_powerline_separators = 0
"
""CtrlP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

"Ack
nnoremap <leader>g :Ack <cword><cr>

"bufferline stuff
set laststatus=2
let g:bufferline_solo_highlight = 0
let g:bufferline_inactive_highlight = '' "No highlighting
let g:bufferline_active_highlight = '' "No highlighting
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = 0 "always first
let g:bufferline_show_bufnr = 0
let g:bufferline_fname_mod = ':t'


let g:bufferline_echo = 0
  autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

