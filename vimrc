

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               


set nu
set mouse=a
set tabstop=4
autocmd VimEnter * NERDTree
set shiftwidth=4
set ts=4 sw=4

"custom vimrc starts from here
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'dracula/vim'
Plug 'kaicataldo/material.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'joshdick/onedark.vim'
Plug 'davidhalter/jedi-vim'

call plug#end()

set background=dark
colorscheme gruvbox
set termguicolors

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on
" Highlight cursor line underneath the cursor horizontally.
set cursorline
set incsearch
set nowrap
set ignorecase
set showcmd
set showmode
set hlsearch
set history=1000
set wildmenu
":AirlineTheme base16_apathy

if &term == "alacritty"        
	let &term = "xterm-256color"
endif

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-python',
  \ 'coc-java'
  \ ]


" java compile
map <F3> :call CompileJava()<CR>

func! CompileJava()
	:w
	:!javac "%"
endfunc

" run class
map <F4> :call RunClass()<CR>

func! RunClass()
	:!java -cp "%:p:h" "%:t:r"
endfunc

map <F5> :call RunPackageClass()<CR>

func! RunPackageClass()
	:!cd .. && cd .. && java -cp "%:p:h" "%:t:r"
endfunc

vmap <C-c> "+y
vmap <C-x> "+x
imap <C-v> <esc>P

map <C-e> :call RunTerminal()<CR>
func! RunTerminal()
	:belowright terminal
endfunc

map <C-t> :call RunNewTab()<CR>
func! RunNewTab()
	:tabnew | NERDTreeToggle
endfunc

map <C-s> :call RunSave()<CR>
func! RunSave()
	:w
endfunc
