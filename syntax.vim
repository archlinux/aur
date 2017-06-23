if exists("b:current_syntax")
    finish
endif

syntax keyword pseucoKW if else elseif
syntax keyword pseucoKW for while return do continue break default select mutex
syntax keyword pseucoKW waitForCondition signal signalAll condition with
syntax keyword pseucoBool true false
syntax keyword pseucoFunctions println join start unlock
" never swap the following two lines
syntax match pseucoFunctions "\Vlock"
syntax match pseucoTypes "\Vlock "

syntax match pseucoTypes "\V\(int\|bool\|string\)chan\d\*"
syntax keyword pseucoTypes int void bool agent
syntax keyword pseucoTypes struct monitor


syntax match pseucoOperator "\v\+\+"
syntax match pseucoOperator "\v\-\-"
syntax match pseucoOperator "\v\+\="
syntax match pseucoOperator "\v\-\="
syntax match pseucoOperator "\v\*\="
syntax match pseucoOperator "\v\/\="

syntax match pseucoOperator "\v\!"
syntax match pseucoOperator "\v\|\|"
syntax match pseucoOperator "\v\&\&"
syntax match pseucoOperator "\v\%"

syntax match pseucoOperator "\v\<\?"
syntax match pseucoOperator "\v\<\!"


syntax match pseucoNumber "\v<\d+>"

syntax region pseucoString start=/"/ skip=/\\"/ end=/"/ oneline

highlight default link pseucoString String

syntax match pseucoOperator "\v\+"
syntax match pseucoOperator "\v\-"
syntax match pseucoOperator "\v\*"
syntax match pseucoOperator "\v\/"
syntax match pseucoOperator "\v\?"
syntax match pseucoOperator "\v\:"

syntax keyword mainAgent mainAgent

syntax match pseucoComment "\v *\/\/.*$"


highlight default link pseucoComment Comment
highlight default link pseucoNumber Number
highlight default link pseucoOperator Operator
highlight default link pseucoBool Boolean

highlight default link pseucoKW Keyword
highlight default link mainAgent Include
highlight default link pseucoTypes Type

highlight default link pseucoFunctions Function

let b:current_syntax = "pseuco"
