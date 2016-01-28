" Vim syntax file
" Language:	Knowledge Interchange Format
" Last Change:	$Date: 2002/10/01 21:34:02 $
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"syn match KifVar        /\$\$\S*\s*\s=\s\s*.*\$\$/
syn match KifComment    /;.*$/

syn match KifBlockCommentSkip contained /^\s*/
"  syntax match	cCommentSkip	contained "^\s*\*\($\|\s\+\)"
syn region KifBlockComment start="#|" end="|#"

syn keyword KifKeyword role init true goal legal not
syn keyword KifKeyword distinct or next terminal does

syn cluster KifRelationContents   contains=KifKeyword,Number,String,KifVariable
syn cluster KifRelationContents   add=KifComment

syn region KifRelation transparent start="(" end=")" contains=@KifRelationContents, KifRelation

"syn match KifRelation /(\a*\> /

syn match KifVariable /?[a-zA-Z][a-zA-Z-_0-9]*/

"/\<?[A-Za-z][A-Za-z-_0-9]*\>/

syn match Number /\<\d\+\>/
syn match String /\<[A-Za-z][A-Za-z-_0-9]*\>/
syn match Operator /\(<=\|?\)/

if !exists("did_kif_syntax_inits")
    let did_kif_syntax_inits = 1
    hi link KifComment Comment 
    hi link KifBlockComment Comment 
    hi link KifKeyword Keyword
    hi link KifVariable Identifier
endif

let b:current_syntax="kif"
