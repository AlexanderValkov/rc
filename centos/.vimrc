colorscheme delek

set tabstop=4
set shiftwidth=4
set expandtab

set pastetoggle=<F2>
filetype plugin indent on

set nu
nnoremap <CR> :noh<CR><CR>

ab { {<CR>}<Up><End>

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
        autocmd BufNewFile *.pl 0r ~/.vim/templates/template.pl
    augroup END
endif
