_spigot() {
  local cur prev words cword
  _init_completion || return

  case "$prev" in
  --help | --version | --licence) return ;;

  --tentative)
    COMPREPLY=($(compgen -W 'on off auto' -- "$cur"))
    return
    ;;

  -[bB])
    COMPREPLY=($(compgen -W '{2..36}' -- "$cur"))
    return
    ;;
  esac

  if [[ $cur == -* ]]; then
    COMPREPLY=($(compgen -W '$(_parse_help "$1" --help) --printf --rz --ri --ru --rd --rn --rno --rnz --rni --rnu --rnd --tentative --safe --version --help --licence' -- "$cur"))
    return
  fi

  _filedir
} && complete -F _spigot spigot

# vim: sw=2 sts=2 et ai ft=bash
