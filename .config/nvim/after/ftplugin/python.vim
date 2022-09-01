let b:ale_linters = {'python': ['vim-lsp']}
let b:ale_fixers = {'python': ['isort', 'black']}
let b:ale_fix_on_save = 1

let $AUR_CONFIG = 'conf/config'
let $PYTHONPATH = '/home/kevr/dev/aurweb'

map <C-t> <Cmd>split<Bar>term pytest -x %:p<CR>GG<CR>
map <C-y> <Cmd>split<Bar>term pytest -x /home/kevr/dev/aurweb/test<CR>GG<CR>
map <C-r> <Cmd>split<Bar>term python3 %:p<CR>GG<CR>
