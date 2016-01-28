" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
"set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

"set background=dark

let colors_name = "mydefault"

"highlight Normal ctermfg=252 ctermbg=232
highlight Normal guifg=#d0d0d0 ctermfg=252 ctermbg=16 guibg=#000033

"highlight Todo   ctermfg=232 ctermbg=46
highlight Todo   ctermfg=46 ctermbg=24 guifg=#00ff00 guibg=#005f87

" TODO asdasdasd

highlight Search ctermfg=81 ctermbg=60 guifg=#5fd7ff guibg=#5f5faf

highlight Special ctermfg=160 guifg=#d70000

highlight Comment ctermfg=46 guifg=#00ff00
highlight Statement ctermfg=178 cterm=NONE guifg=#d7af00
highlight Type ctermfg=27 guifg=#005fff

highlight cSpecial ctermfg=198 guifg=#ff0087

highlight Number ctermfg=130 guifg=#af5f00
highlight String ctermfg=210 guifg=#ff8787
highlight Character ctermfg=210 guifg=#ff8787

highlight Operator ctermfg=241 guifg=#626262
highlight cOperator ctermfg=241 guifg=#626262
highlight cParen ctermfg=241 guifg=#626262
highlight cCppParen ctermfg=241 guifg=#626262
highlight cppParen ctermfg=241 guifg=#626262


highlight LineNr ctermfg=241 guifg=#626262 guibg=background

hi NonText term=bold ctermfg=LightBlue gui=bold guifg=LightBlue guibg=#000033

highlight Folded guifg=#828282 guibg=#200044

hi SpellBad term=reverse cterm=underline ctermfg=200 gui=undercurl guisp=Red

" set DiffAdd to white (grey) on blue
hi DiffAdd term=bold ctermfg=7 ctermbg=LightBlue guibg=LightBlue


" vim: sw=2
