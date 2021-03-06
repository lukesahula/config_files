syntax enable
colorscheme monokai

" Plug download and setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'vim-python/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-css-color'
call plug#end()

" Linters
let g:ale_linters = {'javascript': ['eslint']}

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" don't user arrowkeys in insert mode
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv~

set encoding=utf-8 " always use utf-8
set backupcopy=yes " do not use swaps and update directly files (hot reload)
set clipboard=unnamedplus " set the os register for vim clipboard
set cursorline " highlight current line
set number " show line numbers
set foldmethod=indent
set foldnestmax=2 " maximum nested folds
set nofoldenable " do not fold files when opening
set foldlevel=2 " folding level
let &colorcolumn="80,".join(range(100,999),",") " color max length breakpoints
set tabstop=2 " spacing
set softtabstop=2 
set shiftwidth=2
set expandtab "use spaces instead of tabs
set numberwidth=4
set directory=~/.vim/swps
set history=1000 " default is 20, I'd rather set this to ∞
set undodir=~/.vim/undodir " dir for undo history.
set undofile " maintain undo history between sessions.
set noshowmode " do not show indicator for insert, use lightline instead
set iskeyword-=_ " treat underscores as a word break in strings
command! Wq wq " https://sanctum.geek.nz/arabesque/vim-koans/
command! WQ wq
command! W w
command! Q q
command! Vsplit vsplit
command! Split split
