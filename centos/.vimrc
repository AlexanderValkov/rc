colorscheme delek

set tabstop=4
set shiftwidth=4
set expandtab

set pastetoggle=<F2>
filetype plugin indent on

set nu
nnoremap <CR> :noh<CR><CR>

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
        autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
    augroup END
endif

"execute pathogen#infect()

" reconfigure jedi autocompletion to Ctrl + N 
"let g:jedi#completions_command = "<C-N>"

set omnifunc=python3complete#Complete
