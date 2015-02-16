set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating' 
"Bundle 'tpope/vim-markdown' 

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'rking/ag.vim'
Bundle 'wellle/targets.vim' 
Bundle 'koron/nyancat-vim' 
Bundle 'triglav/vim-visual-increment' 
Bundle 'justinmk/vim-sneak' 
Bundle 'sophacles/vim-processing' 
Bundle 'vim-scripts/bufkill.vim' 
Bundle 'mhinz/vim-startify' 
Bundle 'Shougo/vimproc.vim' 
Bundle 'ap/vim-buftabline'
Bundle 'reedes/vim-wordy'
Bundle 'fatih/vim-go'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'gabrielelana/vim-markdown'
"Bundle 'hdima/python-syntax'

Bundle 'Shougo/unite.vim' 
Bundle 'tsukkee/unite-tag' 
Bundle 'Shougo/unite-outline' 
Bundle 'Shougo/vimfiler.vim' 
Bundle 'Shougo/neomru.vim' 
Bundle 'Shougo/neocomplete.vim' 
Bundle 'thinca/vim-unite-history' 

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
"set showbreak=&&
set linebreak
set breakindent
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
"colorscheme molokai

hi TabLineFill ctermfg=0 ctermbg=0

"hi TabLineSel ctermfg=Red ctermbg=Yellow
hi BufTabLineActive ctermfg=DarkBlue ctermbg=black
hi BufTabLineCurrent ctermfg=DarkGreen ctermbg=black
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
nnoremap <silent> <leader>ev :badd ~/.vimrc<cr>
"Source .vimrc
nnoremap <silent> <leader>sv :source ~/.vimrc<cr>
"Fast Saves
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>q :q<cr>

" Close quickfix list
nnoremap <silent> <leader>c :ccl<cr>

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

"Tab Management
nnoremap <silent> <down> :tabprev<CR>
nnoremap <silent> <up> :tabnext<CR>


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
nnoremap <leader>1 I# <esc>
nnoremap <leader>2 I## <esc>
nnoremap <leader>3 I### <esc>

vnoremap <leader>1 I# <esc>
vnoremap <leader>2 I## <esc>
vnoremap <leader>3 I### <esc>

vnoremap <silent> <leader>1 :s/^/\#\ / <cr> 
vnoremap <silent> <leader>2 :s/^/\##\ / <cr> 
vnoremap <silent> <leader>3 :s/^/\###\ / <cr> 
"List
"Command to make ordered lists
command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
vnoremap <silent> <leader>l :s/^/\+\ / <cr> 
nnoremap <silent> <leader>l I+ <esc> 
vnoremap <silent> <leader>o :Number<cr>

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
"set laststatus=2 "always show statusline
set laststatus=0 "always show statusline

"statusline ala tpope
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"Wordy stuff
hi SpellBad cterm=underline ctermfg=darkred
nnoremap <silent> <leader>z :NextWordy<cr>
nnoremap <silent> <leader>Z :NoWordy<cr>

"zt sucks
nnoremap <leader>t zt

"Make netrw look like NerdTREE
let g:netrw_liststyle=3
let g:netrw_banner=0

"Disable folding in vim markdown plugin
let g:markdown_enable_folding = 0
let g:markdown_include_jekyll_support = 0
let g:markdown_enable_mappings = 0

"Unite stuff
"Unite ag settings
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
          \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

"Set unite highlight color as the cursorline
call unite#custom#profile('default', 'context', { 'cursor_line_highlight' : 'CursorLine' })

let g:unite_source_history_yank_enable = 1

nnoremap <space>y :Unite -silent -no-resize -no-split history/yank<cr>

nnoremap <space>m :Unite -silent -no-resize -no-split file_mru<cr>
nnoremap <space>b :Unite -silent -no-resize -no-split buffer<cr>
nnoremap <space>o :Unite -silent -no-resize -no-split outline<cr>
nnoremap <space>h :Unite -silent -no-resize -no-split history/command<cr>

nnoremap <space>/ :Unite -silent -no-start-insert -no-resize -no-split grep:.<cr>
nnoremap <leader>/ :UniteWithCursorWord -silent -no-start-insert -no-resize -no-split grep:.<cr>

nnoremap <space>v :Unite -silent -no-resize -no-split -start-insert buffer<cr>
"nnoremap <space>c :Unite -silent -no-resize -no-split tag/include<cr>
nnoremap <space>c :Unite -silent -no-resize -no-split tag<cr>

"VimFiler Stuff
nnoremap <silent> <space>n :VimFilerBufferDir -force-quit<cr>
"make q default to close vimfiler
autocmd FileType vimfiler map <buffer> q <Plug>(vimfiler_exit)
autocmd FileType unite map <buffer> q <Plug>(unite_all_exit)

let g:vimfiler_force_overwrite_statusline = 0

" AG stuff
"nnoremap <leader>/ :Ag <cword><cr>

" Turn off K = docs in pde files
let g:processing_doc_style = 0

" Use vimfiler as default file explorer
let g:vimfiler_as_default_explorer = 1

"Lets me use enter in the commandline history buffer, It's usually mapped to add lines
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

"Rainbow Parenthesis stuff
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

augroup rainbow
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
augroup END

" make Go look beautiful
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_doc_keywordprg_enabled = 0
" Auto add imports
"let g:go_fmt_command = "goimports"

" make python look beautiful
"let g:python_highlight_all = 1

" neocomplete stuff I don't really care to understand but makes neocomplete work how I want
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
	  let g:neocomplete#sources#omni#input_patterns = {}
endif

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"

function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

