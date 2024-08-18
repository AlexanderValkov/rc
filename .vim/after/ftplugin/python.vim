iab main def main():<CR><CR><C-w>if __name__ == "__main__":<CR>main()<Esc>3<Up>o
iab pf print(f"")<Left><Left>
iab #p print("")<Left><Left>
iab class class:<CR>def __init__():<Up><End><Left>
iab #i import
iab #s sys.argv[]<Left>
iab #r for i in range():<Left><Left>
" Here, you can set the setting directly, or call a command or function
" to help you.  We'll call a command, and then implement that command in
" your top-level vimrc to help keep things in one place.
SetupPython
