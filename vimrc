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
Bundle 'rking/ag.vim'
Bundle 'wellle/targets.vim' 
Bundle 'koron/nyancat-vim' 
Bundle 'triglav/vim-visual-increment' 
Bundle 'bling/vim-bufferline' 
Bundle 'justinmk/vim-sneak' 
Bundle 'sophacles/vim-processing' 
Bundle 'junegunn/goyo.vim' 
Bundle 'Valloric/YouCompleteMe' 
Bundle 'vim-scripts/bufkill.vim' 
Bundle 'mhinz/vim-startify' 
Bundle 'godlygeek/tabular' 
Bundle 'Shougo/vimproc.vim' 

Bundle 'Shougo/unite.vim' 
Bundle 'tsukkee/unite-tag' 
Bundle 'Shougo/unite-outline' 
Bundle 'Shougo/vimfiler.vim' 
Bundle 'Shougo/neomru.vim' 

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
" yank / paste to clipboard
set clipboard=unnamed
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
"Find tags file
set tags=tags;/
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
"Turn off stupid preview window
set completeopt-=preview
" Maximum colors
set t_Co=256

colorscheme base16-default

"Key Remaps
" Enter adds lines in normal mode
nnoremap <CR> o<Esc>
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
	setlocal nolist
	set formatoptions+=l
	setlocal linebreak 
	setlocal showbreak=
endfu 
com! WP call WordProcessorMode()

"File Type Settings
augroup filetxt_txt
	autocmd!
	autocmd BufEnter,BufNewFile,BufRead *.txt call WordProcessorMode()  
	autocmd BufEnter,BufNewFile,BufRead *.txt set syntax=markdown
augroup END

augroup filetype_md
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.md call WordProcessorMode()  
augroup END

augroup filetype_pde
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.pde setf java
augroup END

"Remove auto comment
augroup remove_autocomment
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"Leader Keys
let mapleader = ','

"Edit .vimrc
nnoremap <silent> <leader>ev :split ~/.vimrc<cr>
"Source .vimrc
nnoremap <silent> <leader>sv :source ~/.vimrc<cr>
"Fast Saves
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>q :q<cr>

"Easier pasting from clipboard
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

"Easier wanking to clipboard
nmap <leader>y "+y
nmap <leader>Y "+y$
vmap <leader>y "+y
vmap <leader>Y "+y$

"Buffer Management
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <silent> <leader>d :BD<CR>

"Quick spelling correction
inoremap <C-f> <esc>[s1z=gi
nnoremap <C-f> [s1z=<C-o>

nnoremap <C-]> <C-]>zt

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
vnoremap <silent> <leader>u I+ <esc> 
nnoremap <silent> <leader>u I+ <esc> 
vnoremap <silent> <leader>o :Number<cr>

" Turn Goyo on, Not sure if I like this. 
"nnoremap <silent> <leader>g :Goyo<cr>

"Cap word
nnoremap <leader>` gUw

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

"Unite stuff
"Unite ag settings
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
          \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_history_yank_enable = 1

nnoremap <space>y :Unite -silent -no-resize history/yank<cr>

nnoremap <space>m :Unite -silent -no-resize -no-split file_mru<cr>
nnoremap <space>b :Unite -silent -no-resize -no-split buffer<cr>
nnoremap <space>o :Unite -silent -no-resize -no-split outline<cr>
nnoremap <space>/ :Unite -silent -no-resize -no-split grep:.<cr>

nnoremap <space>v :Unite -silent -no-resize -no-split -start-insert buffer<cr>
nnoremap <space>c :Unite -silent -no-resize -no-split -start-insert tag/include<cr>

"VimFiler Stuff
nnoremap <silent> <space>n :VimFilerBufferDir -force-quit<cr>
"make q default to close vimfiler
autocmd FileType vimfiler map <buffer> q <Plug>(vimfiler_exit)
let g:vimfiler_force_overwrite_statusline = 0

" AG stuff
nnoremap <leader>g :Ag <cword><cr>

" Load tabular
let g:tabular_loaded = 1

" Turn off K = docs in pde files
let g:processing_doc_style = 0

" Use vimfiler as default file explorer
let g:vimfiler_as_default_explorer = 1
