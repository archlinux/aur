# bash completion for lx-music-shell
# Install to: /usr/share/bash-completion/completions/lx-music-shell

_lx_music_shell() {
    local cur prev words cword
    _init_completion || return
    
    local commands="search test-sources update-sources import-source help version"
    local sources="kugou kuwo netease qq migu ximalaya"
    
    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(compgen -W "$commands" -- "$cur"))
        return
    fi
    
    case "${words[1]}" in
        search|-s|--search)
            # No completion for search query
            ;;
        source|--source)
            COMPREPLY=($(compgen -W "$sources" -- "$cur"))
            ;;
        import-source)
            _filedir
            ;;
    esac
}

complete -F _lx_music_shell lx-music-shell
