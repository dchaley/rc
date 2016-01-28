
augroup filetypedetect
au BufNewFile,BufRead *.moin setf moin
au BufNewFile,BufRead *.wiki setf moin

au BufNewFile,BufRead *.c setlocal syntax=std_c 

au BufNewFile,BufRead *.157 setlocal syntax=cs157 nocindent autoindent

au BufNewFile,BufRead *.kif setfiletype lisp 
au BufNewFile,BufRead *.kif setlocal syntax=kif nocindent autoindent

au BufNewFile,BufRead *.gdlc setlocal syntax=gdlc nocindent autoindent

autocmd BufNewFile,BufRead *.lyx setlocal syntax=lyx foldmethod=syntax foldcolumn=3
autocmd BufNewFile,BufRead *.lyx syntax sync fromstart

autocmd BufNewFile,BufRead *.lisp setlocal lispwords-=do

autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead,BufNewFile *.py set syntax=mypython cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python compiler pylint
autocmd FileType python setlocal omnifunc=pysmell#Complete
autocmd FileType python setlocal nosmartindent

augroup END

