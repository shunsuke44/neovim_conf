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
set cursorline
set virtualedit=block
set showmatch matchtime=1
" tab key
set expandtab " use space instead of tab
set shiftwidth=4 " head of a line
set tabstop=4 " not head of a line
set smartindent
set incsearch
set hlsearch
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
tnoremap <C-P> <C-l>"*
tnoremap <2-RightMouse> <C-l>"*
tnoremap <F9> a.exe<CR><C-l>"*
tnoremap <ESC> <C-l>N


map Q gq

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

" gui fonts
if has("win32")
    set guifont=Consolas:h13:w7
    set guifontwide=MS_Gothic
endif

" screen size
" if !exists("s:loaded_vimrc")
"   let s:loaded_vimrc = 0
"   set lines=40
"   set columns=120
" endif

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
" build current file (termwinkey = <C-l>)
autocmd Filetype cpp nnoremap <F5> :w <bar> let @f = @% <bar> call GoToTerm()<CR>
                                    \g++ -std=c++14 -Wall <C-l>"f<CR>

" python
" execute current file
autocmd Filetype python nnoremap <F5> <Esc>:w <bar> !python <C-r>%<CR>
" syntax plugin
" https://github.com/vim-python/python-syntax
let g:python_highlight_exceptions = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1


" ====================================
"       vim-plug
" ====================================
let g:plugged_dir=stdpath('data') . '/plugged'

call plug#begin(g:plugged_dir)
    
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


" ====================================
"       Plugin settings
" ====================================
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" airline
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1
" " vim-go
let g:go_code_completion_enabled=0
let g:go_def_mapping_enabled=0

lua require('init')
