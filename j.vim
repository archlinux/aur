" Vim syntax file
" Language: J
" Maintainer: Bill Lam<bbill.lam@gmail.com>
" Last Change:
"   2008 Apr 04  Initial commit
"   2009 Feb 13  UPload to jwiki

" It is by no means complete.
" Send comments, suggestions and requests to the maintainer.

if exists("b:current_syntax")
  finish
endif

if exists("j_minlines")
  let b:j_minlines = j_minlines
else
  let b:j_minlines = 15
endif
exec "syn sync linebreaks=1 minlines=" . b:j_minlines

" jVerb
" = < <. <: > >. >: _: + +. +: * *. *: - -. -: % %. %: ^ ^. $ $. $: ~. ~: | |. |:
" , ,. ,: ; ;: # #. #: ! /: \: [ [: ] { {. {: {:: }. }: ". ": ? ?.
" A. c. C. e. E. i. i: I. j. L. o. p. p: q: r. s: u: x:
" _9: _8: _7: _6: _5: _4: _3: _2: _1: 0: 1: 2: 3: 4: 5: 6: 7: 8: 9:
" jNoun
" a. a: _. _:
" jConjuction
" ^: . .. .: :  :. :: ;. !. !: " ` `: @ @. @: & &. &: &.: d. D. D: H. L: S: T.
" jAdverb
" ~ / \ /. \. } b. f. M. t. t:

syn match jName          "\a\w*"
syn match jArgument      "\<[xymnuv]\.\=\>" contained
syn match jNumber        "[_0-9][_0-9\.a-zA-Z]*"

syn match jConjunction   "\."
syn match jConjunction   ":"

syn match jVerb          "[-!#$%\*+,;<=>\?[\]^{|]"
syn match jConjunction   "[\"&@`]"
syn match jAdverb        "[/\\}~]"

syn match jVerb          "[-\"#\$%\*+,<>\?^{|}~]\."
syn match jConjunction   "[!&@;:\.]\."
syn match jAdverb        "[/\\]\."
syn match jVerb          "p\.\."

syn match jVerb          "[-\"#\$%\*+,;<>\?\[{|}~/\\]:"
syn match jConjunction   "[!&@^\.:]:"
syn match jConjunction   "&\.:"
syn match jVerb          "{::"
syn match jVerb          "_\=\d:"

syn match jVerb          "[AcCeEiIjLopr]\."
syn match jConjunction   "[dDHT]\."
syn match jAdverb        "[bfMt]\."

syn match jVerb          "[ipqsux]:"
syn match jConjunction   "[DLS]:"
syn match jAdverb        "t:"

syn match jNoun          "[a_][\.:]"
syn match jCopula        "=[\.:]"
syn match jParenthesis   "[()]"

syn match jControl       "\<assert\."           contained
syn match jControl       "\<break\."            contained
syn match jControl       "\<case\."             contained
syn match jControl       "\<catch\."            contained
syn match jControl       "\<catchd\."           contained
syn match jControl       "\<catcht\."           contained
syn match jControl       "\<continue\."         contained
syn match jControl       "\<do\."               contained
syn match jControl       "\<else\."             contained
syn match jControl       "\<elseif\."           contained
syn match jControl       "\<end\."              contained
syn match jControl       "\<fcase\."            contained
syn match jControl       "\<for_\%(\a\w*\)\=\." contained
syn match jControl       "\<goto_\%(\a\w*\)\."  contained
syn match jControl       "\<if\."               contained
syn match jControl       "\<label_\%(\a\w*\)\." contained
syn match jControl       "\<return\."           contained
syn match jControl       "\<select\."           contained
syn match jControl       "\<throw\."            contained
syn match jControl       "\<try\."              contained
syn match jControl       "\<while\."            contained
syn match jControl       "\<whilst\."           contained

syn match jError         "\%('.*'\)*'"

" String and Character contstants
syn region jString oneline start="'" skip="''"  end="'"
syn keyword jTodo    FIXME   contained
syn keyword jTodo    TODO    contained
syn keyword jTodo    XXX     contained
syn region jComment oneline start="NB\." end="$"  contains=jTodo

" enable syntax folding with
setlocal foldmethod=syntax
setlocal nofoldenable

syntax region jDef start="\<\%([1-4]\|13\)\s\+:\s*0\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
syntax region jDef start="\<adverb\s\+define\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
syntax region jDef start="\<conjunction\s\+define\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
syntax region jDef start="\<verb\s\+define\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
syntax region jDef start="\<monad\s\+define\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
syntax region jDef start="\<dyad\s\+define\>" end="^)\s*$" contains=ALLBUT,jTodo transparent keepend fold
" syntax region jBlock start="\<\%(if\|select\|try\|\%(for_\%(\a\w*\)\=\)\|while\|whilst\)\." end="\<end\." contained contains=ALLBUT,jDef,jNounDef,jTodo transparent fold

syntax region jNounDef start="\<0\s\+:\s*0\s*$" end="^)\s*$" keepend fold
syntax region jNounDef start="\<noun\s\+define\s*$" end="^)\s*$" keepend fold

" Define the default highlighting.
if !exists("did_j_syntax_inits")
  hi link jAdverb       Type
  hi link jArgument     Operator
  hi link jComment      Comment
  hi link jConjunction  Macro
  hi link jControl      Keyword
  hi link jCopula       Special
  hi link jError        Error
  hi link jName         Identifier
  hi link jNoun         String
  hi link jNounDef      Define
  hi link jNumber       Number
  hi link jParenthesis  Delimiter
  hi link jString       String
  hi link jTodo         Todo
  hi link jVerb         Operator
endif

let b:current_syntax = "j"
