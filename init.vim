" =========================================
"       change default settings
" =========================================
if &compatible
  set nocompatible
endif
set backspace=indent,eol,start
set history=100		
set ruler		
set showcmd		
set wildmenu		
set ttimeout		
set ttimeoutlen=100	
set display=truncate
set scrolloff=5
set nrformats-=octal
set laststatus=2
set number
set relativenumber
set cursorline
set virtualedit=block
set showmatch matchtime=1
set updatetime=500
set signcolumn=yes
" tab key
set expandtab " use space instead of tab
set shiftwidth=4 " head of a line
set tabstop=4 " not head of a line
set smartindent
set incsearch
set hlsearch
set ignorecase
set smartcase
" window
set splitbelow
set splitright
set nobackup
set clipboard+=unnamed
set encoding=utf-8

syntax enable
filetype plugin indent on

" keymapping
nnoremap <F2> :let @/=""<CR>
" make undo checkpoint before using CTRL-u 
inoremap <C-U> <C-G>u<C-U>
" window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" terminal
tnoremap <ESC> <C-\><C-N>


map Q gq

let mapleader="\<Space>"

" Conditional
if has('win32')
  set guioptions-=t
endif

if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

if has("win32")
    set langmenu=none
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

" gui fonts
if has("win32")
    set guifont=Consolas:h13:w7
    set guifontwide=MS_Gothic
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" autocommand
augroup vimStartup
  au!
  
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

augroup END

augroup TabWidthConfig
  au!
  au FileType html,htmldjango,css,scss,yaml,vim,json,javascript,typescript,typescriptreact,lua setlocal sw=2 ts=2
augroup END

augroup GoTabConfig
  au!
  au FileType go setlocal noet
augroup END

" augroup LspFormatOnSave
"   au!
"   au BufWritePre * lua vim.lsp.buf.format()
" augroup END


" ***** highlighting a wide space *****
" scriptencoding utf-8
" augroup highlightIdegraphicSpace
"   autocmd!
"   autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"   autocmd VimEnter,WinEnter * match IdeographicSpace /　/
" augroup END
" ***** end of highlighting a wide space


" =================================
"       Language preferences
" =================================
" cpp
" syntax plugin 
" https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" python
" execute current file
autocmd Filetype python nnoremap <F5> <Esc>:w <bar> !python <C-r>%<CR>


" ====================================
"       vim-plug
" ====================================
let g:plugged_dir=stdpath('data') . '/plugged'

call plug#begin(g:plugged_dir)

" tools
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" html
Plug 'mattn/emmet-vim'

" colorschemes
Plug 'jacoborus/tender.vim'

call plug#end()


" ====================================
"       Plugin settings
" ====================================
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" fzf.vim
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>r :Rg<CR>

" airline
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1

" vim-go
let g:go_code_completion_enabled=0
let g:go_def_mapping_enabled=0

" emmet
let g:user_emmet_install_global = 0
augroup EmmetConfig
  au!
  au FileType html,htmldjango,css,typescript,typescriptreact EmmetInstall
augroup END

" colorschemes
colorscheme tender


" ===================================
"       AtCoder settings
" ===================================
autocmd! Filetype cpp nnoremap <buffer> <F5> :w <bar> !g++ -std=c++14 -Wall %<CR>

lua require('init')
