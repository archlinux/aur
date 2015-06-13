# Command name bash completion for Fossil.
# Original: Mailing-list contribution by Stuart Rackham.
# Maintainer: Daniel YC Lin <dlin.tw at gmail.com>
# I'm not bash expert, please feed back to me, if you could improve this.
# TODO: fossil branch list --options

function _fossil() {
    local cur commands
    cur=${COMP_WORDS[COMP_CWORD]}
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands=$(fossil help --all)
    if [ $COMP_CWORD -eq 1 ] || [ ${COMP_WORDS[1]} = help ]; then
            # Command name completion for 1st argument or 2nd if help command.
        COMPREPLY=( $(compgen -W "$commands" $cur) )
    else
        case "${prev}" in
            add) opts="--case-sensitive --dotfiles --force --ignore --clean" ;;
            addremove) opts="--case-sensitive --dotfiles --ignore --clean --dry-run" ;;
            all) opts="changes clean dbstat extras ignore info list pull push rebuild sync setting set unset" ;;
            annotate) opts="--filevers --log --limit --ignore-all-space --ignore-trailing-space" ;;
            bisect) opts="bad good log chart next options reset status undo" ;;
            branch) opts="new list" ;;
            merge) opts="--baseline --binary --case-sensitive --force --force-missing --integrate --dry-run --verbose" ;;
        esac
        compopt -o filenames
        COMPREPLY=($(compgen -fW "${opts}" -- "${cur}") \
        $(compgen -d -- "$cur"))
        # File name completion for other arguments.
        #COMPREPLY=( $(compgen -f $cur) )
    fi
}
complete -o default -F _fossil fossil f
# vim: et sw=4 ts=4
