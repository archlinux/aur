_bitrise() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    if ! opts="$(bitrise workflows --id-only 2> /dev/null)"; then
        opts=""
    fi

    if [[ ${prev} == "run" && ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}
complete -F _bitrise bitrise

