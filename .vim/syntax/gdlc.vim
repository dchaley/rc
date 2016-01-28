" Vim syntax file
" Language:	Knowledge Interchange Format
" Last Change:	$Date: 2002/10/01 21:34:02 $
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"syn match GdlcVar        /\$\$\S*\s*\s=\s\s*.*\$\$/
syn match GdlcComment    /;.*$/

syn match GdlcBlockCommentSkip contained /^\s*/
"  syntax match	cCommentSkip	contained "^\s*\*\($\|\s\+\)"
syn region GdlcBlockComment start="#|" end="|#"

syn keyword GdlcKeyword FACT CALL RETURN ARITY

syn keyword GdlcKeyword PUSH_NUM GET SET_FIELDA SET_FIELDC
syn keyword GdlcKeyword CREATE_COROUTINE RESUME YIELD 
syn keyword GdlcKeyword SUCCESS FAIL NIL GOTO

syn keyword GdlcKeyword ALLOCATE_SAVE SAVE RESTORE

syn keyword GdlcKeyword UNIFY_CONST UNIFY_FUNC 
syn keyword GdlcKeyword PUSH_CONSTANT PUSH_FUNCTION PUSH_VARIABLE PUSH_CELL PUSH_COPY POP

"syn cluster GdlcRelationContents   contains=GdlcKeyword,Number,String,GdlcVariable
"syn cluster GdlcRelationContents   add=GdlcComment

"syn region GdlcRelation transparent start="(" end=")" contains=@GdlcRelationContents, GdlcRelation

"syn match GdlcRelation /(\a*\> /

"syn match GdlcVariable /?[a-zA-Z][a-zA-Z-_0-9]*/

"/\<?[A-Za-z][A-Za-z-_0-9]*\>/


syn match GdlcLabel /[a-zA-Z][a-zA-Z0-9-_]*:/
syn match GdlcLabel /:[a-zA-Z][a-zA-Z0-9-_]*/

syn keyword GdlcRegisterName FRAME ARG

syn match String /"[^"]*"/
syn match Number /\<\d\+\>/
syn match Operator /\(<=\|?\|\[\|\]\|<\|>\|\.\)/

if !exists("did_gdlc_syntax_inits")
    let did_gdlc_syntax_inits = 1
    hi link GdlcComment Comment 
    hi link GdlcBlockComment Comment 
    hi link GdlcKeyword Keyword
    hi link GdlcVariable Identifier
    hi link GdlcLabel Label
    hi link GdlcRegisterName Special
endif

let b:current_syntax="gdlc"
