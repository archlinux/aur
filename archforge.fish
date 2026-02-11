# archforge fish completion

complete -c archforge -f -a 'generate build search info deploy interactive init swarm status cache help'

complete -c archforge -n "__fish_seen_subcommand_from generate" -l output -d 'Output file path'
complete -c archforge -n "__fish_seen_subcommand_from generate" -s o -l output -d 'Output file path'
complete -c archforge -n "__fish_seen_subcommand_from generate" -s q -l quiet -d 'Quiet mode'

complete -c archforge -n "__fish_seen_subcommand_from build" -s s -l skippgpcheck -d 'Skip PGP signature check'
complete -c archforge -n "__fish_seen_subcommand_from build" -s d -l nodeps -d 'Skip dependency check'
complete -c archforge -n "__fish_seen_subcommand_from build" -s n -l nobuild -d 'Download only'

complete -c archforge -n "__fish_seen_subcommand_from search" -s s -l short -d 'Short output'
complete -c archforge -n "__fish_seen_subcommand_from search" -l noresults -d 'Limit results'

complete -c archforge -n "__fish_seen_subcommand_from deploy" -f -a 'aur docker flatpak nix'

complete -c archforge -s v -l verbose -d 'Increase verbosity'
complete -c archforge -s c -l config -d 'Config file path'
complete -c archforge -s h -l help -d 'Print help'
complete -c archforge -s V -l version -d 'Print version'