" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'

Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" Some basic settings
set expandtab
set shiftwidth=4
set tabstop=4

set mouse=a

set number
set relativenumber

set scrolloff=5

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·

colorscheme desert

try
    colorscheme dracula
catch
endtry

" Space bindings
let mapleader=" "

" Open and reload init.vim
nnoremap <silent><leader>fed :edit $MYVIMRC<cr>
nnoremap <silent><leader>fer :source $MYVIMRC<cr>

" Save file
nnoremap <silent><leader>fs :write<cr>

" Clipboard operations
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Clear search highlighting
nnoremap <silent><leader><cr> :nohl<cr>

" Toggle whitespace
nnoremap <silent><leader>tw :set list!<cr>

" Quitting
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qw :wq<cr>

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif


let g:airline_powerline_fonts=1
