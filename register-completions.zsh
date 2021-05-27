#compdef dotnet
# zsh parameter completion for the dotnet CLI

_dotnet() 
{
  local completions=("$(dotnet complete "$words")")

  [[ -n "$completions" ]] && compadd -- "${(ps:\n:)completions}"
}

_dotnet "$@"
