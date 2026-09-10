###-begin-notes-completions-###
#
# Static completion script for Bash
#
# Installation:
#   notes --completions bash >> ~/.bashrc
#

if ! type _init_completion &>/dev/null; then
  _init_completion()
  {
    COMPREPLY=()
    local _i _j=0 _piece _line="$COMP_LINE"
    words=("${COMP_WORDS[0]}")
    cword=0
    _line="${_line#*"${COMP_WORDS[0]}"}"
    for ((_i = 1; _i < ${#COMP_WORDS[@]}; _i++)); do
      _piece="${COMP_WORDS[_i]}"
      if [[ "$_line" == [[:blank:]]* ]]; then
        ((_j++))
        words[_j]="$_piece"
      else
        words[_j]="${words[_j]}$_piece"
      fi
      ((_i == COMP_CWORD)) && cword=$_j
      _line="${_line#*"$_piece"}"
    done
    cur="${words[cword]}"
    prev=""
    ((cword > 0)) && prev="${words[cword-1]}"
    return 0
  }
fi

_notes--choices()
{
  local _cur="$1" _word="$2"; shift 2

  local _head="${_cur%"$_word"}"
  local _open=""
  case "$_head" in
    *\') _open="'" ;;
    *\") _open='"' ;;
  esac

  local _prefix="$_cur" _committed="$_head"
  _prefix=${_prefix//\\/}; _prefix=${_prefix//\"/}; _prefix=${_prefix//\'/}
  _committed=${_committed//\\/}; _committed=${_committed//\"/}; _committed=${_committed//\'/}

  COMPREPLY=()
  local _choice _rest _match
  for _choice in "$@"; do
    [[ "$_choice" == "$_prefix"* ]] || continue
    _rest="${_choice#"$_committed"}"
    case "$_open" in
      "'")
        if [[ "$_head" == "'" ]]; then
          _match=${_rest//\'/\'\\\'\'}
        else
          [[ "$_rest" == *\'* ]] && continue
          _match="$_rest"
        fi
        ;;
      '"')
        _match="${_rest//\\/\\\\}"
        _match="${_match//\$/\\$}"
        _match="${_match//\`/\\\`}"
        _match="${_match//\"/\\\"}"
        ;;
      *)
        printf -v _match '%q' "$_rest"
        [[ -z "$_head" && "$_match" == '~'* ]] && _match="\\$_match"
        ;;
    esac
    [[ -n "$_open" && "$_match" == *"$_open" ]] && _match+="$_open"
    COMPREPLY+=("$_match")
  done
}

_notes()
{
  local cur prev words cword i
  local _command_index=0
  _init_completion -n "$COMP_WORDBREAKS" || return
  local _comp_word="$2"

  # Subcommand dispatch
  local cmd _skip_next=0
  for ((i = _command_index + 1; i < cword; i++)); do
    if (( _skip_next )); then
      _skip_next=0
      continue
    fi
    case "${words[i]}" in
      root)
        _notes_root "$i"
        return
        ;;
      context)
        _notes_context "$i"
        return
        ;;
      list)
        _notes_list "$i"
        return
        ;;
      search)
        _notes_search "$i"
        return
        ;;
      read)
        _notes_read "$i"
        return
        ;;
      write)
        _notes_write "$i"
        return
        ;;
      delete)
        _notes_delete "$i"
        return
        ;;
      move)
        _notes_move "$i"
        return
        ;;
      create)
        _notes_create "$i"
        return
        ;;
      targets)
        _notes_targets "$i"
        return
        ;;
      agents)
        _notes_agents "$i"
        return
        ;;
      priority)
        _notes_priority "$i"
        return
        ;;
      open-agent)
        _notes_open_agent "$i"
        return
        ;;
      handoffs)
        _notes_handoffs "$i"
        return
        ;;
      mcp)
        _notes_mcp "$i"
        return
        ;;
      capture)
        _notes_capture "$i"
        return
        ;;
      daemon)
        _notes_daemon "$i"
        return
        ;;
    esac
  done

  local _used_0=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --all|--no-all) _used_0=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --all --no-all"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

  COMPREPLY=( $(compgen -W 'root context list search read write delete move create targets agents priority open-agent handoffs mcp capture daemon' -- "$cur") )
}

_notes_root()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  local _used_0=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --projects|--no-projects) _used_0=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --projects --no-projects"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_context()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
  esac

  local _used_0="" _used_1=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --command) _used_0=1 ;;
      --json|--no-json) _used_1=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --command"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_list()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --format)
      _notes--choices "$cur" "$_comp_word" 'labels' 'json'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --all|--no-all) _used_0=1 ;;
      --tag) _used_1=1 ;;
      --format) _used_2=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --all --no-all"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --tag"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --format"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_search()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --format)
      _notes--choices "$cur" "$_comp_word" 'labels' 'json'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2="" _used_3=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --query) _used_0=1 ;;
      --all|--no-all) _used_1=1 ;;
      --tag) _used_2=1 ;;
      --format) _used_3=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --query"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --all --no-all"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --tag"
  [[ -n "$_used_3" ]] || _filtered_flags+=" --format"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_read()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --json|--no-json) _used_1=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_write()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2="" _used_3=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --stdin|--no-stdin) _used_1=1 ;;
      --expected-hash) _used_2=1 ;;
      --json|--no-json) _used_3=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --stdin --no-stdin"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --expected-hash"
  [[ -n "$_used_3" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_delete()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --json|--no-json) _used_1=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_move()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --to) _used_1=1 ;;
      --json|--no-json) _used_2=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --to"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_create()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --kind)
      _notes--choices "$cur" "$_comp_word" 'note' 'handoff'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2="" _used_3="" _used_4="" _used_5=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --repository) _used_0=1 ;;
      --kind) _used_1=1 ;;
      --name) _used_2=1 ;;
      --description) _used_3=1 ;;
      --stdin|--no-stdin) _used_4=1 ;;
      --json|--no-json) _used_5=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --repository"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --kind"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --name"
  [[ -n "$_used_3" ]] || _filtered_flags+=" --description"
  [[ -n "$_used_4" ]] || _filtered_flags+=" --stdin --no-stdin"
  [[ -n "$_used_5" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_targets()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --format)
      _notes--choices "$cur" "$_comp_word" 'labels' 'json'
      return
      ;;
  esac

  local _used_0=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --format) _used_0=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --format"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_agents()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --format)
      _notes--choices "$cur" "$_comp_word" 'labels' 'json'
      return
      ;;
  esac

  local _used_0=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --format) _used_0=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --format"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_priority()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
    --value)
      _notes--choices "$cur" "$_comp_word" 'low' 'medium' 'high' 'critical'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --value) _used_1=1 ;;
      --json|--no-json) _used_2=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --value"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_open_agent()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --path)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
    --mode)
      _notes--choices "$cur" "$_comp_word" 'default' 'plan'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2="" _used_3=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --path) _used_0=1 ;;
      --agent) _used_1=1 ;;
      --mode) _used_2=1 ;;
      --json|--no-json) _used_3=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --path"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --agent"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --mode"
  [[ -n "$_used_3" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_handoffs()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --format)
      _notes--choices "$cur" "$_comp_word" 'labels' 'json'
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --all|--no-all) _used_0=1 ;;
      --list|--no-list) _used_1=1 ;;
      --format) _used_2=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --all --no-all"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --list --no-list"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --format"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_mcp()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

}

_notes_capture()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --config)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1="" _used_2="" _used_3="" _used_4=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --config) _used_0=1 ;;
      --status|--no-status) _used_1=1 ;;
      --stdin|--no-stdin) _used_2=1 ;;
      --repository) _used_3=1 ;;
      --json|--no-json) _used_4=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --config"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --status --no-status"
  [[ -n "$_used_2" ]] || _filtered_flags+=" --stdin --no-stdin"
  [[ -n "$_used_3" ]] || _filtered_flags+=" --repository"
  [[ -n "$_used_4" ]] || _filtered_flags+=" --json --no-json"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

_notes_daemon()
{
  local cur prev words cword i
  local _command_index="$1"
  _init_completion -n "$COMP_WORDBREAKS" || return

  # Flag value completions
  case "$prev" in
    --config)
      COMPREPLY=( $(compgen -f -- "$cur") )
      return
      ;;
  esac

  local _used_0="" _used_1=""
  for ((i = 1; i < cword; i++)); do
    case "${words[i]%%=*}" in
      --config) _used_0=1 ;;
      --once|--no-once) _used_1=1 ;;
    esac
  done
  local _filtered_flags=""
  [[ -n "$_used_0" ]] || _filtered_flags+=" --config"
  [[ -n "$_used_1" ]] || _filtered_flags+=" --once --no-once"

  # Complete flags (filtered) and subcommands
  if [[ "$cur" == -* ]]; then
    COMPREPLY=( $(compgen -W "$_filtered_flags" -- "$cur") )
    return
  fi

}

complete -F _notes notes
###-end-notes-completions-###
