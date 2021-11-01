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
set nopaste
set nohlsearch

au BufRead,BufNewFile LICENSE *.md setlocal textwidth=79

filetype plugin indent on
syntax on

set background=dark

" set jellybeans to 256 color mode"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:jellybeans_background_color_256='NONE'
set t_Co=256

" airline characters
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

" ale options
let g:airline#extensions#ale#enabled = 1
let g:ale_floating_preview = 0
let g:ale_cursor_detail = 0
let g:ale_hover_to_preview = 0
let g:ale_completion_delay = 1

let g:ale_sign_warning = '☢'
let g:ale_sign_error = '✖'

let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = ' %severity% [%linter%] %s'

let g:ale_linters = {'jinja.html': []}
let g:ale_linters_explicit = 1

let g:ale_set_balloons = 0
let g:ale_set_signs = 1
let g:ale_set_quickfix = 0

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

" Language Server Protocol configuration
let g:lsp_settings = {
\   'pylsp-all': {
\       'workspace_config': {
\           'pylsp': {
\               'configurationSources': ['flake8'],
\               'plugins': {
\                   'pycodestyle': { 'enabled': 0 },
\                   'pyflakes': { 'enabled': 0 },
\                   'flake8': { 'enabled': 1 },
\               }
\           }
\       }
\   },
\}

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall                                                                                         
endif

" vim-plug configuration
call plug#begin("~/.config/nvim/plugged")
    " Theming
    Plug 'kevr/vim-colorschemes' " Modified jellybeans.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Utility
    Plug 'kevr/vim-mdpreview', { 'branch': 'devel', 'do': './install.sh' }

    " C++ clang-format.
    Plug 'rhysd/vim-clang-format'

    " Git
    Plug 'tpope/vim-fugitive'

    " Filetypes
    Plug 'lepture/vim-jinja'

    " Language Servers
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'mattn/vim-lsp-settings'
    Plug 'dense-analysis/ale'
    Plug 'rhysd/vim-lsp-ale'

    " Plug 'neovim/nvim-lspconfig'
call plug#end()

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

colorscheme jellybeans

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ale warning and error colors
highlight ALEWarning ctermfg=red
highlight ALEWarningSign cterm=bold ctermfg=yellow guifg=#ffc430
highlight ALEError ctermfg=red
highlight ALEErrorSign cterm=bold ctermfg=red
