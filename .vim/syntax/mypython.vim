" Vim syntax file
" Language:	Python
" Maintainer:	David Haley

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" set some python options
let python_highlight_numbers = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1

" load in the default python stuff
source $VIMRUNTIME/syntax/python.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" now do our own things:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight string quotation marks
syn region pythonString		start=+[uU]\='+ end=+'+ skip=+\\\\\|\\'+ contains=pythonEscape,@Spell
syn region pythonString		start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=pythonEscape,@Spell
syn region pythonString		start=+[uU]\="""+ end=+"""+ contains=pythonEscape,@Spell
syn region pythonString		start=+[uU]\='''+ end=+'''+ contains=pythonEscape,@Spell
syn region pythonRawString	start=+[uU]\=[rR]'+ end=+'+ skip=+\\\\\|\\'+ contains=@Spell
syn region pythonRawString	start=+[uU]\=[rR]"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell
syn region pythonRawString	start=+[uU]\=[rR]"""+ end=+"""+ contains=@Spell
syn region pythonRawString	start=+[uU]\=[rR]'''+ end=+'''+ contains=@Spell

syn keyword pythonBuiltin True False None
hi def link pythonBuiltin Function

let b:current_syntax = "python"

syn sync maxlines=4000
syn sync minlines=2000

" vim: ts=8
