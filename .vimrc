


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
set nocompatible
"vnoremap # X^H#
set autowrite
set background=dark

" allow backspacing over auto indent, line breaks, and start-of-insert-mode
set bs=2

set modeline

set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation settings
set autoindent " default indent: filetype indent will take over for other files

set cinkeys=0{,0},:,!^F,o,O,e
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,gs,hs,ps,ts,+s,c3,C0,(0,u0,
		   \U0,w0,m0,j1,)20,*30

" Expand tabs to spaces. Use indentation of 2.
" Keep actual tabs at 4. 
set shiftwidth=2
set expandtab
set tabstop=4
" Make it so that <BS> at beginning of line is aware of tabs.
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set errorformat=%f:%l:\ %m
set formatoptions=tcqlorn
set formatprg=par\ w79hl0
set grepprg=grep\ -nH\ $*
set guifont=DejaVu\ Sans\ Mono\ 9

" In windows, override guifont to make it happy
if ($windir != "")
    set guifont=DejaVu_Sans_Mono:h10:cANSI
endif

" Die menubar die!
" set guioptions=agim
set guioptions=agi
set hidden
set history=5000


" highlight search results:
set hlsearch
" by default, ignore case during search:
set ignorecase
" don't ignore case in search if it contains an upper-case:
set smartcase
" preview search incrementally:
set incsearch
" don't word-wrap in the middle of words:
set linebreak
" turn on all mouse features:
set mouse=a
" turn on line numbering:
set number
" display cursor position information in status bar
set ruler
" display buffer number, line position, column position, file type
set rulerformat=%45(%{VimBuddy()}\ buf\ %3(#%n%),\ line\ %9(%l/%L%),\ col\ %c%V\ \ %y%)
" highlight matching parentheses, brackets, etc.
set showmatch

if has('nvim')
  set shada='200,/30,h,s10
else
  set viminfo='200
endif

" turn on syntax highlighting
syntax enable


" highlight the word under the cursor
nmap <A-S-O> :execute "match ShowOccurrences /" . expand("<cword>") . "/"<CR>
nmap <C-A-O> :match none<CR>

" some options for omnicomplete
filetype plugin on
filetype indent on
set completeopt=menuone

" Highlight the line where the cursor is
set cursorline

set diffopt=filler,vertical

"colorscheme myevening
" highlight LineNr ctermfg=darkgray ctermbg=black


" showmarks settings
let g:showmarks_enable=0

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
   
" don't load netrw plugin...
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
command! -nargs=1 -bang -complete=customlist,EditFileComplete EditFile find<bang> <args>
function EditFileComplete(ArgLead,L,P)
    return split(globpath(&path, a:ArgLead . "*"), "\n")
endfunction


" settings to add the STL to omnicpp tags
set tags+=~/.stl.tags
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_NamespaceSearch = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" latex-suite settings:

" default target

" fix pdf compiler settings
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'mydvipdf -title $*.dvi'

" Prevent xvdi from sending stderr to vim buffer
"let g:Tex_ViewRuleComplete_dvi = 'evince "$*.dvi" 2>/dev/null &'
let g:Tex_ViewRuleComplete_dvi = 'advi "$*.dvi" 2>/dev/null &'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pylint settings:

" don't pylint on every write...
let g:pylint_onwrite = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gnome-terminal is stupid about alt. so use control+char for
" various mappings instead of alt+char
imap <C-l> <A-l>
"imap <C-i> <A-i>       " this seems to break normal tabbing...
        " so use this instead:
imap <C-e> <A-i> 

imap <C-E> <C-O>dw


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shamelessly stolen from Vim apprentice piotrek
" ... but modified by dhaley

function! MyTabLine()
    let s = ' %#TabLine#['
    for i in range(tabpagenr('$'))
        let s .= '%#TabLine# '

	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s .= '%#TabLineSel#'
	    else
	      let s .= '%#TabLine#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s .= '%' . (i + 1) . 'T'

	    " the label is made by MyTabLabel()
	    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

        if i < tabpagenr('$') - 1
            let s .= '%#TabLine# |'
        endif

	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLine# ]%#TabLineFill#%T'

	  " right-align the label to close the current tab page
      if tabpagenr('$') > 1
      let s .= '%=%#TabLine#%999Xclose'
      endif

      return s
endfunction

" code for displaying tab number in its label
" type :help tabline for more info
set tabline=%!MyTabLine()

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return a:n . ':' . bufname(buflist[winnr - 1])
endfunction

" end of stuff stolen from piotrek

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View navigation

map <leader>1 :tabn1<CR>
map <leader>2 :tabn2<CR>
map <leader>3 :tabn3<CR>
map <leader>4 :tabn4<CR>
map <leader>5 :tabn5<CR>
map <leader>6 :tabn6<CR>
map <leader>7 :tabn7<CR>
map <leader>8 :tabn8<CR>
map <leader>9 :tabn9<CR>
map <leader>0 :tabn10<CR>
map <leader>! :tabn11<CR>
map <leader>@ :tabn12<CR>
map <leader># :tabn13<CR>
map <leader>$ :tabn14<CR>
map <leader>% :tabn15<CR>
map <leader>^ :tabn16<CR>
map <leader>& :tabn17<CR>
map <leader>* :tabn18<CR>
map <leader>( :tabn19<CR>
map <leader>) :tabn20<CR>

nmap <C-S-Left> <C-W><Left>
nmap <C-S-Up> <C-W><Up>
nmap <C-S-Right> <C-W><Right>
nmap <C-S-Down> <C-W><Down>

nnoremap <leader>q :bp\|bd #<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>l :set invnumber<CR>
map <leader>d :VCSVimDiff<CR>
map <leader>a :VCSAnnotate<CR>

map <leader>b :buffers<CR>

map <leader>` :buf#<CR>

map <leader>s :SessionList<CR>

map  <C-Up>   <C-Y>
imap <C-Up>   <C-O><C-Y>
map  <C-Down> <C-E>
imap <C-Down> <C-O><C-E>
imap <S-Tab> <C-V><TAB>

" <ctrl-p> goes to future position in history (<c-o> goes to past)
nnoremap <C-P> <C-I>
" <tab> indents current line in normal mode
nmap  <Tab> ==


map H :help <C-R>=expand("<cword>")<CR><CR>
map <F3> :grep <C-R>=expand("<cword>")<CR> 

" Tab bindings
"map <A-Right> gt
"map <A-Left> gT
map <Leader>t :tabnew<CR>
map <Leader>T :tabclose<CR>
set showtabline=2
map <A-PageUp> :bprev<CR>
map <A-PageDown> :bnext<CR>

" Smart word boundary left/right
nmap <S-Left> ,b
nmap <S-Right> ,w
imap <S-Left> <C-O>,b
imap <S-Right> <C-O>,w

" tag/item bindings
map <A-Left> :cp<CR>
map <leader><pageup> :cp<CR>
map <A-Right> :cn<CR>
map <leader><pagedown> :cn<CR>
map <A-S-Left> :tp<CR>
map <A-S-Right> :tn<CR>

" map control-c to copy-to-X11-clipboard
map <C-c> "+y

imap <C-D> <C-O>mz<C-O>:call InsertDate()<CR><C-O>`z

function! InsertDate()
    execute "normal i" . strftime("%Y-%m-%d")
endfunction

map <F5> :cp<cr>
map <F6> :cn<cr>
map <F7> :make<cr>
map <Leader><F7> :setlocal spell spelllang=en_us<cr>
map <F8> =a{
map <S-F8> gqap
map <F9> gq]/
map <F2> a{
map !    @:

map <A-8> :match ErrorMsg '\%>80v.\+'<cr>

nmap . .`[

if has("folding")
  "set foldtext=MyFoldText()
  " {{{ fold function
  function! MyFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    return v:folddashes . sub
  endfunction
  set foldmethod=marker
  " }}} end fold function
  
  set foldenable
  set foldlevelstart=99
  set foldmethod=syntax

  nnoremap <Space> za
  vnoremap <Space> za

  function! FoldText()
    let l:lpadding = &fdc
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~ 'id=' ? 2 : 0

    if exists("+relativenumber")
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
  set foldtext=FoldText()
endif

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

map <Leader>T :Tlist<cr>

if &term == 'linux'
    set background=dark
    "set t_Co=256
    "colorscheme mydefault
    colorscheme delek
    "hi CursorLine ctermbg=233 cterm=none
    set t_AB=[48;5;%dm
    set t_AF=[38;5;%dm
endif

"if (has("gui"))
    "set background=dark
    "colorscheme mydefault
"endif

"if (has("unix") && &term == 'xtermc') 
"    set background=dark 
"    set t_Co=256 
"    colorscheme mydefault
"endif 

if (&term == 'xterm' || &term == 'xterm-color' || &term == 'xterm-256color' || &term == 'xtermc' || &term == 'rxvt')
    "set term=xtermc
    colorscheme delek

    " Custom color settings
    highlight MatchParen ctermbg=grey

    highlight TabLine ctermfg=white ctermbg=black
    highlight TabLineSel ctermfg=black ctermbg=grey
    highlight TabLineFill ctermfg=white ctermbg=black

    " some further settings for Gnome Terminal -- our terminal of choice!
    if ($COLORTERM == "gnome-terminal")
        set t_Co=16
        set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
        set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm

        colorscheme david-colors
    endif

    if (&term == 'xtermc' || $COLORTERM == 'xterm-color' || &term == 'xterm-256color')
        "set t_Co=256
        "set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
        "set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm

        colorscheme david-colors

        " FIXME: replace with david-colors once it's color adaptive
        let g:lumen_light_colorscheme = "morning"
        let g:lumen_dark_colorscheme = "david-colors"
    endif

    if ($COLORTERM == "rxvt" || $COLORTERM == "rxvt-xpm")
        set t_Co=256

        colorscheme david-colors
    endif

endif

" Hack to get the delete key working with iterm... ??
if ($COLORTERM == "iterm")
    imap <C-H> <C-H>
endif

" If there is a local vimrc file, load it
let localvimrc = $HOME . "/.vimrc-local"
if (filereadable(localvimrc))
    execute "source " . localvimrc
endif

set exrc
set secure

" Initialize pathogen package management system
execute pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

  let g:ackprg = 'ag --vimgrep'
  "set shellpipe=>

  function Search(string) abort
    let saved_shellpipe = &shellpipe
    let &shellpipe = '>'
    try
      execute 'Ack!' shellescape(a:string, 1)
    finally
      let &shellpipe = saved_shellpipe
    endtry
  endfunction

  nnoremap <Leader>f :call Search("")<left><left>
  nnoremap <Leader>F :call Search(expand('<cword>'))<cr>
  
  nnoremap <Leader>p :Buffers<cr>
else
  cnoreabbrev Ack Ack!
  nnoremap <Leader>f :Ack!<Space>
endif


let g:ctrlp_root_markers = ['.ctrlproot']
let g:ctrlp_brief_prompt = 1

" if the current directory has its own vimrc, source it
if filereadable(".vimrc-custom")
    source .vimrc-custom
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf.vim

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <c-p> :Files<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight text matching word under cursor
:autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar

function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

if has('statusline')
    set statusline=\ 
    set statusline+=%f\ 
    set statusline+=%=
    " buf/cursor info
    set statusline+=%45(%{VimBuddy()}\ buf\ %3(#%n%)\ line\ %9(%l/%L%),:%c%V%)\ 
    " highlight group for thing under cursor
    set statusline+=%25(%{SyntaxItem()}%)\ 
    " current file type
    set statusline+=%y\ 
endif
"set statusline=%{SyntaxItem()}

let g:indentLine_char='⦙'
nmap <leader>i :IndentLinesToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if v:version >= 703 && !has('nvim')
  " Note: Relative number is quite slow with Ruby, so is cursorline
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 norelativenumber nocursorline
else
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open nerdtree if no file was opened
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>o :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
"
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_json_syntax_conceal = 0

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf
