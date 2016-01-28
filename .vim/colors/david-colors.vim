" Vim color file
" Maintainer:	David Schweikert <dws@ee.ethz.ch>
" Last Change:	2006 Apr 30


" Modifications by dchaley

hi clear

let colors_name = "david-colors"

" Normal should come first
hi Normal     guifg=White guibg=Black
hi Cursor     cterm=reverse guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan
    
    
if &t_Co == 256
  hi CursorLine cterm=none ctermbg=17 guibg=#000022
  hi Directory  ctermfg=27
else
  hi CursorLine cterm=none guibg=#000022
  hi Directory  ctermfg=DarkBlue	   guifg=Blue
endif


" Note: we never set 'term' because the defaults for B&W terminals are OK


if &background == "dark"
    hi DiffAdd    ctermbg=DarkBlue     guibg=DarkBlue guibg=#ccffcc
    hi DiffChange ctermbg=LightMagenta guibg=#ffcccc
    hi DiffDelete ctermfg=LightBlue    ctermbg=DarkGrey gui=bold guifg=Blue guibg=#ccccff
    hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=Red

    if &t_Co == 256
        hi DiffAdd    ctermbg=17     guibg=DarkBlue guibg=#ccffcc
        hi DiffChange ctermbg=239  guibg=#ffcccc
        hi DiffDelete ctermfg=203    ctermbg=DarkGrey gui=bold guifg=Blue guibg=#ccccff
        hi DiffText   ctermbg=99	   cterm=bold gui=bold guibg=Red
    endif

else
    hi DiffAdd    ctermbg=LightCyan    guibg=LightCyan
    hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
    hi DiffDelete ctermfg=DarkBlue	   ctermbg=LightBlue gui=bold guifg=Blue guibg=LightCyan
    hi DiffText   ctermbg=Red	   ctermfg=White cterm=bold gui=bold guibg=Red
endif



hi ErrorMsg   ctermfg=White	   ctermbg=DarkRed  guibg=Red	    guifg=White
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=#101010
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi Search     ctermfg=Black ctermbg=DarkYellow guibg=#aaaa00 guifg=NONE
hi SpecialKey ctermfg=DarkBlue	   guifg=Blue
hi StatusLine cterm=bold	   ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold	   ctermbg=blue ctermfg=black  guibg=gold guifg=blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi VertSplit  cterm=reverse	   gui=reverse
hi Visual     ctermbg=NONE	   cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed	   guifg=Red
hi WildMenu   ctermfg=Black	   ctermbg=Yellow    guibg=Yellow guifg=Black

" syntax highlighting
hi Comment    cterm=NONE ctermfg=DarkRed     gui=NONE guifg=red2
hi Constant   cterm=NONE ctermfg=DarkGreen   gui=NONE guifg=green3
hi Identifier cterm=NONE ctermfg=DarkCyan    gui=NONE guifg=cyan4
hi PreProc    cterm=NONE ctermfg=DarkMagenta gui=NONE guifg=magenta3
hi Type	      cterm=NONE ctermfg=Blue	     gui=bold guifg=blue

hi Number     cterm=NONE ctermfg=Yellow gui=NONE guifg=Yellow



hi Pmenu      guibg=LightBlue
hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue

if &t_Co == 256
  highlight Operator ctermfg=241 guifg=#626262
  highlight cOperator ctermfg=241 guifg=#626262
  highlight cParen ctermfg=241 guifg=#626262
  highlight cCppParen ctermfg=241 guifg=#626262
  highlight cppParen ctermfg=241 guifg=#626262

  
  hi Statement  cterm=bold ctermfg=27	     gui=bold guifg=#005fff
  hi Special    cterm=NONE ctermfg=202         gui=NONE guifg=deeppink
  hi LineNr     ctermfg=166	   guifg=#af5f00

  hi Pmenu      ctermbg=17 guibg=LightBlue

  hi Label      ctermfg=55

  hi Type ctermfg=23

else

  hi Statement  cterm=bold ctermfg=Blue	     gui=bold guifg=#005fff

  hi Special    cterm=NONE ctermfg=LightRed    gui=NONE guifg=deeppink
  hi LineNr     ctermfg=Brown	   guifg=#af5f00
endif


hi ShowOccurrences cterm=bold ctermbg=blue ctermfg=yellow guibg=gold guifg=blue


highlight MatchParen ctermfg=Red ctermbg=DarkGrey cterm=bold


highlight TabLine ctermfg=white ctermbg=black
highlight TabLineSel ctermfg=black ctermbg=grey
highlight TabLineFill ctermfg=white ctermbg=black

" vim: sw=2

