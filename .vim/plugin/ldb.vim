:function! Move(file)
:  if expand("%:p") != fnamemodify(expand(a:file), ":p")
:    execute "tab :drop " . a:file
:  endif
:endfunction
:command! -bar -nargs=+ -complete=file Move call Move(<q-args>)
:function! LDBFormat()
:  if v:servername == "LDBVIM"
:    set number
:    set cul
:  endif
:endfunction
:au BufNew * call LDBFormat()
