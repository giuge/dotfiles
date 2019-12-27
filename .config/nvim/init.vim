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
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline-themes'

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'

  " Nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Javascript plugins
  Plug 'w0rp/ale'
  Plug 'jparise/vim-graphql'

  " Elixir
  Plug 'mhinz/vim-mix-format'

  " Fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


set background=dark
set termguicolors
let base16colorspace=256
let g:airline_theme='base16_chalk'
colorscheme base16-default-dark

" italics comments ;)
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

" Make comments italic
function! s:base16_customize() abort
  call Base16hi("Comment", g:base16_gui03, "", g:base16_cterm03, "", "italic", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

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
map <leader>f :Files<CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

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

nmap <silent> <Leader>< <Plug>(ale_previous_wrap)
nmap <silent> <Leader>> <Plug>(ale_next_wrap)
nmap <silent> <Leader>? <Plug>(ale_detail)

" Show linting errors in the status line
let g:airline#extensions#ale#enabled = 1

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

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,md call pencil#init()
" augroup END

" Intellisense config

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline#extensions#coc#enabled = 0

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Elixir
let g:mix_format_on_save = 1
