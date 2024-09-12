" Vim syntax file
" Language: Agda

" Usage Instructions
" Put this file in .vim/syntax/agda.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.agda set filetype=agda
if exists("b:current_syntax")
  finish
endif

syntax clear
let b:current_syntax = "agda"


" Function
syntax match agdaFunction '\<\a\w*\(\.\w\+\)*\s*\ze('


" Language keywords
syntax keyword agdaKeywords open case with for in as switch type if then elif else do while when then pass rewrite match object let

"Number literals
syntax match agdaNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"

" Operator
syntax match agdaOperator "[-!|&+<>=%/*~^:]"

" Strings literals
syntax region agdaString start=/\v"/ skip=/\v\\./ end=/\v"/

" Strings
syntax region agdaString start='"' end='"'
syntax region agdaString start='\'' end='\''

" Specials
syntax keyword agdaSpecial lambda Nil Cons One Zero Succ pred true false new empty tie E I O pos neg tail head fst snd lft rgt left right val True False

" Type
syntax match agdaTypeNames "\<[A-Z][a-zA-Z0-9_']*\>"

" Comments
syntax region agdaCommentLine start="--" end="$"

" TODO
syntax keyword agdaTodo contained TODO FIXME XXX TBD NOTE

syntax match agdaUnusedFuncDef '\v<_[a-z0-9_]+'
            \ contained
            \ nextgroup=agdaTypeDefParams

syntax keyword agdaUserIdent def return in import
syntax match agdaUserStorage "(\s*\a\w*\s*\(,\s*\a\w*\s*\)*)"

syntax match agdaUserStorage ' \zs[a-zA-Z0-9_]\+\ze\s*='
syntax match agdaUserStorage ' \zs[a-zA-Z0-9_]\+\ze\s*:'


syntax region agdaAttribute
            \ matchgroup=agdaDelimiter
            \ start='\v#!?\['
            \ skip='\v\(.*\)'
            \ end='\]'

syntax region agdaAttributeParenWrapped
            \ start='('
            \ end=')'
            \ containedin=agdaAttribute
            \ contains=TOP
            \ keepend
syntax region agdaAttributeParenWrapped
            \ start='{'
            \ end='}'
            \ containedin=agdaNumberj
            \ contains=TOP
            \ keepend

" Define a new syntax group for Agda symbols
syntax match agdaSymbol /{!!}/

syntax keyword agdaModule module where

syntax keyword agdaLets let refl


" Link the new syntax group to the same highlight group as numeric operators
syntax match agdaSpecialSymbols /λ\|→\|∀/

nnoremap \to i→<ESC>
nnoremap \l iλ<ESC>
nnoremap \f i∀<ESC>

inoremap \to →
inoremap \l λ
inoremap \f ∀
inoremap \N ℕ
inoremap \Z ℤ
inoremap \e ∃
inoremap \b ⊥
inoremap \t ⊤

" Set highlights
highlight default link agdaTypeNames      Type
highlight default link agdaNumber         Number
highlight default link agdaFunction       Function
highlight default link agdaSpecial        MoreMsg
highlight default link agdaOperator       Operator
highlight default link agdaString         String
highlight default link agdaFn             Keyword
highlight default link agdaKeywords       Statement
highlight default link agdaCommentLine    Comment
highlight default link agdaTodo           Todo
highlight default link agdaFuncDef        Function
highlight default link agdaUserIdent      Identifier
highlight default link agdaAttribute      Keyword
highlight default link agdaDelimiter      Delimiter
highlight default link agdaUnusedFuncDef  agdaFuncDef
highlight default link agdaUserStorage    Constant
highlight default link agdaSymbol         Question
highlight default link agdaModule         Identifier
highlight default link agdaLets           Define
highlight default link agdaSpecialSymbols Macro
