if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
    augroup end
endif

let b:ale_linters = {'cpp': ['vim-lsp']}
let b:ale_fixers = {'cpp': ['clang-format']}
let b:ale_fix_on_save = 1

map <F2> :!clear && g++ -std=c++17 %:p -o /tmp/blah.exe && /tmp/blah.exe<CR>

nnoremap <C-c> :belowright split \| resize 12 \| term g++ -std=c++17 %:p -o /tmp/blah.exe && /tmp/blah.exe<CR>
