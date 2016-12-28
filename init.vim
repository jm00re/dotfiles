set nocompatible
filetype off

call plug#begin('~/.config/neovim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'wellle/targets.vim'
Plug 'triglav/vim-visual-increment'
Plug 'vim-scripts/bufkill.vim'
Plug 'ap/vim-buftabline'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'scrooloose/syntastic'
Plug 'luochen1990/rainbow'
Plug 'christoomey/vim-tmux-navigator'

"Autocomplete stuff
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Language Specific Stuff
Plug 'justinmk/vim-syntax-extra'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'othree/yajs.vim'
Plug 'sophacles/vim-processing'
Plug 'gabrielelana/vim-markdown'
Plug 'jelera/vim-javascript-syntax'

"Colors
Plug 'molokai'
Plug 'zenburn'
Plug 'inkpot'
Plug 'desert256.vim'
Plug 'nanotech/jellybeans.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'ronny/birds-of-paradise.vim'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on    " required

" Other Shit
" Why are swap files enabled by default?
set nobackup
set nowritebackup
set noswapfile
" Smart tab defaults
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Auto indenting
set autoindent
set smarttab
" yank / paste to clipboard
set clipboard=unnamed
" Case insensitive searching
set incsearch
set ignorecase
set smartcase
set nohlsearch
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
"set showbreak=&&
set linebreak
set breakindent

"set viminfo+=n~/.vim/viminfo

" Doesn't turn long wrapped lines into @s
set display=lastline
" Switch from unsaved buffers
set hidden
" ooo pretty
syntax on
"Turn off stupid preview window
set completeopt-=preview
" Maximum colors
set background=dark
set t_Co=256

let g:gruvbox_termcolors = 16

"colorscheme base16-default
"colorscheme molokai
colorscheme gruvbox

" Gruvbox had some slightly dark word background. This fixes that
" hi Normal ctermbg = 0

hi TabLineFill ctermfg=0 ctermbg=0

"hi TabLineSel ctermfg=Red ctermbg=Yellow
hi BufTabLineActive ctermfg=DarkGreen ctermbg=black
hi BufTabLineCurrent ctermfg=DarkBlue ctermbg=black
hi BufTabLineHidden ctermbg=Black ctermfg=Gray

"hi BufTabLineActive ctermfg=DarkBlue ctermbg=black
"hi BufTabLineCurrent ctermfg=DarkGreen ctermbg=black
"Key Remaps
" Enter adds lines in normal mode
nnoremap <CR> o<Esc>
cnoremap <CR> <CR>

"j and k move down to the next text on wrapped lines
map j gj
map k gk

"Improved indenting
vmap > >gv
vmap < <gv

nnoremap n nzz
nnoremap N Nzz

"I have no clue why this isn't enabled by default
nnoremap Y y$

"Switch the default action of , to \
nnoremap \ ,

"Less stupid line movement
map L $
map H ^

"K breaks lines, J makes more sense"
nnoremap J :join!<cr>
map K i<cr><esc>

"Text Writing, copped straight from Dr. Bunsen
func! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	setlocal spell spelllang=en_us
	setlocal spell
	setlocal nolist
	setlocal linebreak
	setlocal showbreak=
	set complete+=s
	set formatprg=par
	set formatoptions+=l
	syntax spell toplevel
endfu
com! WP call WordProcessorMode()

"File Type Settings
augroup filetxt_txt
	autocmd!
	autocmd BufEnter,BufNewFile,BufRead *.txt call WordProcessorMode()
augroup END

augroup filetype_md
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.md call WordProcessorMode()
augroup END

augroup filetype_tex
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.tex call WordProcessorMode()
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

" augroup filetype_js
" 	autocmd!
" 	autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" augroup END
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"Leader Keys
let mapleader = ','

"Edit .vimrc
nnoremap <silent> <leader>ev :badd ~/.config/nvim/init.vim<cr>
"Source .vimrc
nnoremap <silent> <leader>sv :source ~/.config/nvim/init.vim<cr>
"Fast Saves
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>q :q<cr>

"Yank whole buffer
nnoremap <leader>y ggyG
"Replace buffer with paste
nnoremap <leader>p ggVGp

"Close quickfix list
nnoremap <silent> <leader>c :ccl<cr>

"Format paragraph
nnoremap <silent> <leader>f vipgq

"Fix Whitespace
"nnoremap <silent> <leader>ws :FixWhitespace<cr>

"Buffer Management
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <silent> <leader>d :BD<CR>

tnoremap <silent> <left> <C-\><C-n>:bprev<CR>
tnoremap <silent> <right> <C-\><C-n>:bnext<CR>

"Make perusing buffers a bit easier while I'm moving through them
nnoremap <silent> <up> <C-u>
nnoremap <silent> <down> <C-d>

"Quick spelling correction
nnoremap <C-f> [s1z=<c-o>
inoremap <C-f> <c-g>u<Esc>[s1z=`]A<c-g>u

"Ctag search selection lands at the top of the window
"Why wouldn't you want to see the contents of a function you're searching for?
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
nnoremap <silent> <leader>1 :s/^\s*/&#\ / <cr>
nnoremap <silent> <leader>2 :s/^\s*/&##\ / <cr>
nnoremap <silent> <leader>3 :s/^\s*/&###\ / <cr>

vnoremap <silent> <leader>1 :s/^\s*/&#\ / <cr>
vnoremap <silent> <leader>2 :s/^\s*/&##\ / <cr>
vnoremap <silent> <leader>3 :s/^\s*/&###\ / <cr>

"List
"Command to make ordered lists
command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
vnoremap <silent> <leader>l :s/^\s*/&+\ / <cr>
nnoremap <silent> <leader>l :s/^\s*/&+\ / <cr>
"nnoremap <silent> <leader>l I+ <esc>
vnoremap <silent> <leader>o :Number<cr>

"Keep selection when indenting lines
vnoremap <silent> < <gv
vnoremap <silent> > >gv

"Cap word
nnoremap <leader>` gUw

"Ack
"nnoremap <leader>g :Ack <cword><cr>

"bufferline stuff
"set laststatus=2 "always show statusline
set laststatus=2 "always show statusline

"statusline ala tpope
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"zt sucks
nnoremap <leader>t zt

"open term
nnoremap <leader>z :term<cr>

"Make netrw look like NerdTREE
let g:netrw_liststyle=3
let g:netrw_banner=0

"Disable folding in vim markdown plugin
let g:markdown_enable_folding = 0
let g:markdown_include_jekyll_support = 0
let g:markdown_enable_mappings = 0

" Turn off K = docs in pde files
let g:processing_doc_style = 0

"Lets me use enter in the commandline history buffer, It's usually mapped to add lines
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

"Rainbow Parenthesis stuff
" let g:rbpt_colorpairs = [
" \ ['brown',       'RoyalBlue3'],
" \ ['Darkblue',    'SeaGreen3'],
" \ ['darkgray',    'DarkOrchid3'],
" \ ['darkgreen',   'firebrick3'],
" \ ['darkcyan',    'RoyalBlue3'],
" \ ['darkred',     'SeaGreen3'],
" \ ['darkmagenta', 'DarkOrchid3'],
" \ ['brown',       'firebrick3'],
" \ ['gray',        'RoyalBlue3'],
" \ ['darkmagenta', 'DarkOrchid3'],
" \ ['Darkblue',    'firebrick3'],
" \ ['darkgreen',   'RoyalBlue3'],
" \ ['darkcyan',    'SeaGreen3'],
" \ ['darkred',     'DarkOrchid3'],
" \ ['red',         'firebrick3'],
" \ ]

" augroup rainbow
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" augroup END

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


" make Go look beautiful
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_doc_keywordprg_enabled = 0
" Auto add imports
" let g:go_fmt_command = "goimports"

" make python look beautiful
" let g:python_highlight_all = 1

" Fixing things that are busted in nvim

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap <C-h> <esc><C-w>h
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k
inoremap <C-l> <esc><C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd TermClose * call feedkeys('<cr>')

"nnoremap <space>n :e.<cr>

set viminfo+=n~/.config/nvim/tmpfiles/viminfo

set ttimeout
set ttimeoutlen=0

" FZF Stuff
let g:fzf_layout = { 'down': '~20%' }

nnoremap <silent> <space>n :Files<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>t :Tags<CR>
nnoremap <silent> <space>h :History<CR>
nnoremap <silent> <space>/ :execute 'Ag ' . input('Ag/')<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history'

"" syntastic stuff
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_python_checkers = ['pylint']
"
"let g:syntastic_loc_list_height=3

autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

"Fix this
"nnoremap <silent> <leader>/ call SeachWordWithAg()<cr>
"vnoremap <silent> <leader>/ call SearchVisualSelectionWithAg()<cr>
"
"function! SearchWordWithAg()
"	execute 'Ag' expand('<cword>')
"endfunction
"
"function! SearchVisualSelectionWithAg() range
"	let old_reg = getreg('"')
"	let old_regtype = getregtype('"')
"	let old_clipboard = &clipboard
"	set clipboard&
"	normal! ""gvy
"	let selection = getreg('"')
"	call setreg('"', old_reg, old_regtype)
"	let &clipboard = old_clipboard
"	execute 'Ag' selection
"endfunction

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"nnoremap <leader>td i\todo[inline]{jm:}<esc>F:a<space>

