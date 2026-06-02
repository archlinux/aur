_qoderclicn() {
    local cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    cmds="mcp plugins skills hooks agents login commit rollback update remote-control status feedback"

    opts="-d --debug -m --model --reasoning-effort --context-window -i --prompt-interactive -w --cwd --worktree --permission-mode --dangerously-skip-permissions --allowed-mcp-server-names --tools --allowed-tools --disallowed-tools --attachment --plugin-dir -c --continue --fork-session -r --resume -n --name --session-id --remote --remote-session --teleport --remote-control --list-sessions --delete-session --add-dir -o --output-format --input-format --max-output-tokens -p --print --agent --agents --append-system-prompt --system-prompt --output-style --mcp-config --strict-mcp-config --setting-sources --settings -v --version -h --help"

    case "$prev" in
        --permission-mode)
            COMPREPLY=( $(compgen -W "default accept_edits bypass_permissions dont_ask plan auto" -- "$cur") )
            return 0
            ;;
        --output-format|-o)
            COMPREPLY=( $(compgen -W "text json stream-json" -- "$cur") )
            return 0
            ;;
        -w|--cwd|--add-dir|--plugin-dir)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return 0
            ;;
        --attachment)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return 0
            ;;
    esac

    if [[ "$cur" == -* ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
    else
        COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
    fi
}

complete -F _qoderclicn qoderclicn
