let mapleader  =","

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'jreybert/vimagit'
  Plug 'vimwiki/vimwiki'
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-commentary'
  Plug 'vifm/vifm.vim'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'pangloss/vim-javascript'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components'
  Plug 'elzr/vim-json'
  Plug 'jparise/vim-graphql'
call plug#end()

set background=dark
let g:solarized_termcolors=256 "this is what fixed it for me
" colorscheme monokai
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

set go=a
set mouse=a
set nohlsearch
" set clipboard=unnamedplus

" Some basics:
  nnoremap c "_c

  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number
  set expandtab
  set shiftwidth=2

" Enable autocompletion:
  set wildmode=longest,list,full

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

" Check file in shellcheck:
  map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

" Open corresponding .pdf/.html or preview
  map <leader>p :!opout <c-r>%<CR><CR>

" Automatically deletes all trailing whitespace on save.
  autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and vifm configs with new material:
  autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
