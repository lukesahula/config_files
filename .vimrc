syntax enable
colorscheme monokai

set mouse=a

" let g:ale_disable_lsp = 1
" let g:ale_cursor_detail = 1

" Plug download and setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Valloric/YouCompleteMe'
" Plug 'sheerun/vim-polyglot'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
" Plug 'udalov/kotlin-vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'evanleck/vim-svelte'
" Plug 'jparise/vim-graphql'
" Plug 'vim-python/python-syntax'
Plug 'leafgarland/typescript-vim'
" Plug 'wuelnerdotexe/vim-astro'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'findango/vim-mdx'

" Plug 'nvim-lua/plenary.nvim'
" Plug 'MunifTanjim/nui.nvim'
" Plug 'dpayne/CodeGPT.nvim'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'amadeus/vim-css',
call plug#end()

autocmd FileType scss setl iskeyword+=@-@

" Linters
" let g:ale_linters = {'javascript': ['eslint', 'prettier'], 'typescript': ['eslint', 'tslint', 'prettier'], 'javascriptreact': ['eslint', 'prettier'], 'typescriptreact': ['eslint', 'tslint', 'prettier']}
" let g:ale_fixers = {'javascript': ['eslint', 'prettier'], 'typescript': ['eslint', 'tslint', 'prettier'], 'javascriptreact': ['eslint', 'prettier'], 'typescriptreact': ['eslint', 'tslint', 'prettier']}
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
" let g:ale_fix_on_save = 1

" Astro
let g:astro_typescript = 'enable'

" Coc keys
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

inoremap <silent><expr><TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr><Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr><Up> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"
inoremap <silent><expr><cr> pumvisible() ? coc#_select_confirm() : "\<cr>"

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv~

" Go to definition in new split
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>

set encoding=utf-8 " always use utf-8
set backupcopy=yes " do not use swaps and update directly files (hot reload)
set clipboard=unnamedplus " set the os register for vim clipboard
set cursorline " highlight current line
set number " show line numbers
set relativenumber " show relative line numbers.
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
let g:ycm_filepath_completion_use_working_dir = 1 " Support absolute path imports
command! Wq wq " https://sanctum.geek.nz/arabesque/vim-koans/
command! WQ wq
command! W w
command! Q q
command! Vsplit vsplit
command! Split split
command! F Files
command! FZ Files
command! FZF Files
command! FZFA Files
command! FA Files

set fileformat=unix
set fileformats=unix,dos

let $FZF_DEFAULT_COMMAND='sh -c "command find -L . -mindepth 1 -path ''*\/.git*'' -prune -o -path ''*\/*.ico'' -prune -o -path ''*\/*.DS_Store'' -prune -o -path ''*\/*.pdf'' -prune -o -path ''*\/*.psd'' -prune -o -path ''*\/*.jpg'' -prune -o -path ''*\/*.svg'' -prune -o -path ''*\/*.png'' -prune -o -path ''*\/node_modules'' -prune -o -path ''*\/.hg*'' -prune -o -type f -print -o -type l -print 2> /dev/null | cut -b3-"'

:highlight CocFloating ctermfg=white ctermbg=black
:highlight CocErrorFloat  ctermfg=white ctermbg=black guifg=#ff0000
:highlight CocWarningFloat  ctermfg=white ctermbg=black guifg=#fab005
