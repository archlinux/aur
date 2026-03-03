# Bash completion for qodercli
# Generated for qodercli AUR package

_qodercli() {
  local cur prev words cword
  _init_completion || return

  local -a commands
  commands=(jobs rm feedback help mcp status update)

  local -a global_opts
  global_opts=(
    --agents --allowed-tools --attachment --branch
    --dangerously-skip-permissions --disallowed-tools
    --help --input-format --max-output-tokens --max-turns
    --model --output-format --path --print --quiet
    --resume --version --with-claude-config --workspace
    --worktree --yolo
    -c -f -h -p -q -r -v -w
  )

  # Global flags with arguments
  case ${prev} in
    --agents|--allowed-tools|--disallowed-tools)
      return
      ;;
    --attachment)
      _filedir
      return
      ;;
    --branch)
      return
      ;;
    --input-format)
      COMPREPLY=($(compgen -W "text stream-json" -- "${cur}"))
      return
      ;;
    --max-output-tokens)
      COMPREPLY=($(compgen -W "16k 32k" -- "${cur}"))
      return
      ;;
    --max-turns)
      return
      ;;
    --model)
      COMPREPLY=($(compgen -W "auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate" -- "${cur}"))
      return
      ;;
    --output-format|-f)
      COMPREPLY=($(compgen -W "text json stream-json" -- "${cur}"))
      return
      ;;
    --path|--workspace|-w)
      _filedir -d
      return
      ;;
    --print|-p|--resume|-r)
      return
      ;;
  esac

  # Subcommand-specific completion
  if [[ ${#words[@]} -ge 2 ]]; then
    local subcmd=${words[1]}
    case ${subcmd} in
      jobs)
        _qodercli_jobs
        return
        ;;
      rm)
        _qodercli_rm
        return
        ;;
      feedback)
        _qodercli_feedback
        return
        ;;
      mcp)
        _qodercli_mcp
        return
        ;;
      status)
        _qodercli_status
        return
        ;;
      update)
        return
        ;;
      help)
        COMPREPLY=($(compgen -W "${commands[*]}" -- "${cur}"))
        return
        ;;
    esac
  fi

  # Complete commands or global options
  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${global_opts[*]}" -- "${cur}"))
  else
    COMPREPLY=($(compgen -W "${commands[*]}" -- "${cur}"))
  fi
}

_qodercli_jobs() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-a --all -h --help -w --workspace)

  case ${prev} in
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_rm() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(--kubeconfig --namespace -h --help -w --workspace)

  case ${prev} in
    --kubeconfig)
      _filedir
      return
      ;;
    --namespace)
      return
      ;;
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_feedback() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-c --content -h --help -i --images -s --session --workdir -w --workspace)

  case ${prev} in
    -c|--content|-s|--session)
      return
      ;;
    -i|--images)
      _filedir
      return
      ;;
    --workdir|-w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp() {
  local cur prev words cword
  _init_completion || return

  local -a subcmds
  subcmds=(add auth get list remove)

  local -a opts
  opts=(-h --help -w --workspace)

  case ${prev} in
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  # Handle nested subcommands
  if [[ ${#words[@]} -ge 3 ]]; then
    local subcmd=${words[2]}
    case ${subcmd} in
      add)
        _qodercli_mcp_add
        return
        ;;
      auth)
        _qodercli_mcp_auth
        return
        ;;
      get)
        _qodercli_mcp_get
        return
        ;;
      list)
        _qodercli_mcp_list
        return
        ;;
      remove)
        _qodercli_mcp_remove
        return
        ;;
    esac
  fi

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  else
    COMPREPLY=($(compgen -W "${subcmds[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp_add() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-e --env -H --header -h --help -s --scope -t --transport -w --workspace)

  case ${prev} in
    -e|--env|-H|--header)
      return
      ;;
    -s|--scope)
      COMPREPLY=($(compgen -W "local user project" -- "${cur}"))
      return
      ;;
    -t|--transport)
      COMPREPLY=($(compgen -W "stdio sse http" -- "${cur}"))
      return
      ;;
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp_auth() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-h --help -w --workspace)

  case ${prev} in
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp_get() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-h --help -w --workspace)

  case ${prev} in
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp_list() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-h --help -w --workspace)

  case ${prev} in
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_mcp_remove() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-h --help -s --scope -w --workspace)

  case ${prev} in
    -s|--scope)
      COMPREPLY=($(compgen -W "local user project" -- "${cur}"))
      return
      ;;
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

_qodercli_status() {
  local cur prev words cword
  _init_completion || return

  local -a opts
  opts=(-h --help -o --output -w --workspace)

  case ${prev} in
    -o|--output)
      COMPREPLY=($(compgen -W "text json" -- "${cur}"))
      return
      ;;
    -w|--workspace)
      _filedir -d
      return
      ;;
  esac

  if [[ ${cur} == -* ]]; then
    COMPREPLY=($(compgen -W "${opts[*]}" -- "${cur}"))
  fi
}

complete -F _qodercli qodercli
