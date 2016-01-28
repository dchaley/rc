" Vim syntax file
" Language:	CS 157 Grading
" Maintainer:	Bob Hiestand <bob@hiestandfamily.org>
" Last Change:	$Date: 2002/10/01 21:34:02 $
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match 157Var        /\$\$\s*\S*\s*\s=\s\s*.*\$\$/
syn match 157Comment    /%.*%/

if !exists("did_cs157_syntax_inits")
let did_cs157_syntax_inits = 1
hi link 157Var Special
hi link 157Comment Comment 
endif

let b:current_syntax="cs157"
