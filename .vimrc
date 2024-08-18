syntax enable
colorscheme delek

set tabstop=2
set shiftwidth=2
set expandtab

set pastetoggle=<F2>
filetype plugin indent on
set hls
set nu
nnoremap <CR> :noh<CR><CR>

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
        autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
        autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
    augroup END
endif

"execute pathogen#infect()

" reconfigure jedi autocompletion to Ctrl + N 
"let g:jedi#completions_command = "<C-N>"

set omnifunc=python3complete#Complete

function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    setlocal softtabstop=2
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()
