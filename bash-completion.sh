_minetest_worldmapper() 
{
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts="--world --config --output --help --version -w -c -o -h -V"

    ### erweiterte Vervollstaendigung ###
    case "${prev}" in

        --world | -w )
            COMPREPLY=( $(compgen -d -- ${cur}) )
            return 0
            ;;

        --config | --output | -c | -o )
	    COMPREPLY=( $(compgen -f -- ${cur}) )
            return 0
            ;;

        *)
        ;;
    esac

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))  
    return 0
}
complete -o filenames -F _minetest_worldmapper minetest-worldmapper
