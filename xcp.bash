_xcp() {
  local cur prev words cword
  _init_completion || return

  # xcp also supports lowercase units and IEC variants (KiB, etc),
  # but we don't list them here to limit visual noise
  local units='B KB MB GB'
  local drivers='parfile parblock'

  case "$prev" in
  -h | --help) return ;;

  --block-size)
    if [[ -z $cur ]]; then
      COMPREPLY=(1MB) # show default block size
    else
      local num="${cur%%[^0-9]*}"
      local unit="${cur##*[0-9]}"
      COMPREPLY=($(compgen -P "$num" -W "$units" -- "$unit"))
    fi
    return
    ;;

  --driver)
    COMPREPLY=($(compgen -W "$drivers" -- "$cur"))
    return
    ;;

  -w | --workers)
    COMPREPLY=($(compgen -W "{0..$(_ncpus)}" -- "$cur"))
    return
    ;;
  esac

  if [[ $cur == -* ]]; then
    COMPREPLY=($(compgen -W '$(_parse_help "$1" -h) -v -r -w -n -g -T -h' -- "$cur"))
    return
  fi

  _filedir
} && complete -F _xcp xcp

# vim: sw=2 sts=2 et ai ft=bash
