" kevr's vim configuration. kevr (or Kevin) writes in C, C++,
" Python, Javascript, HTML and CSS, and so he has various
" diagnostic, linting and formatting plugins used in his config.

" Local editor settings.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set cursorline
set noswapfile
set encoding=utf-8
set colorcolumn=80
set mouse=a
set ttymouse=sgr
set ballooneval
set balloonevalterm

set t_Co=256 " 256-color.
set background=dark


filetype plugin indent on
syntax on

" Airline characters.
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

" C/C++ clang-format options.
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 0

" C++ lsp highlighting options.
let g:lsp_cxx_h1_log_file = '/tmp/vim-lsp.log'
let g:lsp_cxx_h1_verbose_log = 1
let g:lsp_cxx_hl_ft_whitelist = ['c', 'cc', 'cpp', 'h', 'hpp']

" Ale options.
let g:ale_set_balloons = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_floating_preview = 0
let g:ale_cursor_detail = 1

let g:ale_sign_warning = '☢'
let g:ale_sign_error = '✖'

let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = ' %severity% [%linter%] %s'

let g:ale_linters = {'python': ['flake8'], 'jinja.html': []}
let g:ale_linters_explicit = 1

" Configure jellybeans to use 256 colors and the terminal's
" background color instead of jellybeans.
let g:jellybeans_background_color_256='NONE'

" coc-php.
let g:phpfmt_autosave = 1

call plug#begin("~/.vim/plugged")
    " Theme plugins.
    Plug 'kevr/vim-colorschemes' " Modified jellybeans.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Filesystem exploration.
    Plug 'preservim/nerdtree'

    " coc.nvim; the master language server maintainer.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " C++ clang-format.
    Plug 'rhysd/vim-clang-format'

    " Python diagnostics: ALE.
    " We use coc-pyright for other features, such as auto-format
    " and auto-isort, but diagnostics are left to ALE in a modified
    " repository which uses vim's popup_atcursor feature.
    Plug 'kevr/ale', {'branch': 'devel'}

    " Jinja filetype.
    Plug 'lepture/vim-jinja'

    " Javascript semantics.
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'

    " C++ colors via LSP.
    Plug 'prabirshrestha/vim-lsp'
    Plug 'jackguo380/vim-lsp-cxx-highlight'

    " Git.
    Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme jellybeans

" coc.nvim warning and error colors.
highlight CocWarningSign ctermfg=Red
highlight CocWarningHighlight ctermfg=Red
highlight CocErrorSign ctermfg=Red
highlight CocErrorHighlight ctermfg=Red

" ale warning and error colors.
highlight ALEWarning ctermfg=red
highlight ALEWarningSign cterm=bold ctermfg=yellow
highlight ALEError ctermfg=red
highlight ALEErrorSign cterm=bold ctermfg=red

" ale navigation.
" - CTRL+j = previous error
" - CTRL+k = next error
"
nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)
