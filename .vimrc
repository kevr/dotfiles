
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set cursorline

set noswapfile
set encoding=utf-8

set colorcolumn=80

syntax on
set mouse=a

let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 0

let g:lsp_cxx_h1_log_file = '/tmp/vim-lsp.log'
let g:lsp_cxx_h1_verbose_log = 1

let g:lsp_cxx_hl_ft_whitelist = ['c', 'cc', 'cpp', 'h', 'hpp']

call plug#begin("~/.vim/plugged")

    " Theme plugins.
    Plug 'kevr/vim-colorschemes'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'rhysd/vim-clang-format'

    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'

    " ccls, pyls is installed via pacman.
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-python'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    Plug 'lepture/vim-jinja'

call plug#end()

set t_Co=256
let g:jellybeans_background_color_256='NONE'
set background=dark " or light if you prefer the light version
colorscheme jellybeans

highlight CocWarningSign ctermfg=Red
highlight CocWarningHighlight ctermfg=Red
highlight CocErrorSign ctermfg=Red
highlight CocErrorHighlight ctermfg=Red

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

filetype plugin indent on

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-s>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-v>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-s>'

let g:UltiSnipsExpandTrigger = '<s-tab>'
