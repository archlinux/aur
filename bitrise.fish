complete -f -c bitrise -n '__fish_use_subcommand' -a run -d 'run specified workflow'
complete -f -c bitrise -n '__fish_seen_subcommand_from run' -a (bitrise workflows --id-only)

