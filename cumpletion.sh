_cum_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _CUM_COMPLETE=complete $1 ) )
    return 0
}

complete -F _cum_completion -o default cum;
