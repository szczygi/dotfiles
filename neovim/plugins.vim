" Plugin list

scriptencoding utf-8

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'w0rp/ale'

call plug#end()


" Plugin configuration

let g:ale_linters = { 'cpp' : ['clang'] }
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚠'
augroup ALE
  autocmd BufEnter *.cpp,*.h,*.hpp,*.hxx let g:ale_cpp_clang_options =
    \ join(ncm_clang#compilation_info()['args'], ' ')
augroup END

let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:airline#extensions#ale#enabled = 1
let g:bufferline_echo = 0
let g:incsearch#auto_nohlsearch = 1
let g:rooter_change_directory_for_non_project_files = 'home'
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

if has('termguicolors')
  let g:onedark_terminal_italics = 1
endif
" vim: fdm=marker ts=2 sts=2 sw=2 expandtab