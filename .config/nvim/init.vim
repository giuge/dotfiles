let mapleader  =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'jreybert/vimagit'
  Plug 'vimwiki/vimwiki'
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-commentary'
  Plug 'vifm/vifm.vim'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'ledger/vim-ledger'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " Writing
  Plug 'junegunn/goyo.vim'
  Plug 'reedes/vim-pencil'

  " Aesthetics
  Plug 'ryanoasis/vim-devicons'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline-themes'

  " Nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Haskell
  Plug 'neovimhaskell/haskell-vim'

  " Javascript plugins
  Plug 'pangloss/vim-javascript'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components'
  Plug 'w0rp/ale'
  Plug 'elzr/vim-json'
  Plug 'jparise/vim-graphql'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Autocompletion
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
call plug#end()

set background=dark
" let g:vim_monokai_tasty_termcolors=256 "this is what fixed it for me
" let g:vim_monokai_tasty_italic = 1
" colorscheme vim-monokai-tasty
set termguicolors
colorscheme base16-default-dark
let g:airline_theme='base16_chalk'

set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
filetype plugin indent on
set encoding=utf-8
set number
set expandtab
set shiftwidth=2
set directory^=$HOME/.vim/tmp//

" Enable autocompletion:
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Fuzzy finder
map <leader>f :GFiles<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Distraction free writing
map <leader>g :Goyo<CR>

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Open got to file in vertical split
nnoremap gf :vertical wincmd f<CR>

" Linting
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'haskell' : ['hfmt'],
\}
let g:ale_linters = {
\  'haskell': ['ghc', 'hlint']
\}

let g:ale_lint_on_save = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--single-quote ---no-semi -trailing-comma es5'
autocmd FileType js UltiSnipsAddFiletypes javascript-react

nmap <silent> <Leader>< <Plug>(ale_previous_wrap)
nmap <silent> <Leader>> <Plug>(ale_next_wrap)
nmap <silent> <Leader>? <Plug>(ale_detail)

" Show linting errors in the status line
let g:airline#extensions#ale#enabled = 1

" Start autocompletion
let g:deoplete#enable_at_startup = 1

" Show images
:autocmd BufEnter *.png,*.jpg,*gif exec "! sxiv ".expand("%") | :bw

let g:ledger_extra_options = '--pedantic --explicit --check-payees'
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
:command LedgerSort !ledger -f - print

" VimWiki Options
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_hl_headers = 1

" Vim Markdown
set conceallevel=2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

augroup pencil
  autocmd!
  autocmd FileType markdown,md call pencil#init()
  autocmd FileType text call pencil#init()
augroup END

