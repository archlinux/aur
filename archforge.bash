# archforge bash completion

_archforge_completions() {
    local cur prev words cword
    _init_completion || return

    local commands=(
        "generate"
        "build"
        "search"
        "info"
        "deploy"
        "interactive"
        "init"
        "swarm"
        "status"
        "cache"
        "help"
    )

    local generate_opts=(
        "--output"
        "-o"
        "--quiet"
        "-q"
    )

    local build_opts=(
        "--skippgpcheck"
        "-s"
        "--nodeps"
        "-d"
        "--nobuild"
        "-n"
    )

    local search_opts=(
        "--short"
        "--noresults"
        "--rpc"
    )

    local deploy_opts=(
        "aur"
        "docker"
        "flatpak"
        "nix"
    )

    if [[ "$cword" -eq 1 ]]; then
        COMPREPLY=($(compgen -W "${commands[*]}" -- "$cur"))
        return
    fi

    case "${words[1]}" in
        generate)
            COMPREPLY=($(compgen -W "${generate_opts[*]}" -- "$cur"))
            ;;
        build)
            COMPREPLY=($(compgen -W "${build_opts[*]}" -- "$cur"))
            ;;
        search)
            COMPREPLY=($(compgen -W "${search_opts[*]}" -- "$cur"))
            ;;
        deploy)
            COMPREPLY=($(compgen -W "${deploy_opts[*]}" -- "$cur"))
            ;;
    esac
}

complete -F _archforge_completions archforge