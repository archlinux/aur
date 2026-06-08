# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_ostt_global_optspecs
	string join \n c/clipboard paste o/output= p/process= m/model= param= h/help V/version
end

function __fish_ostt_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_ostt_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_ostt_using_subcommand
	set -l cmd (__fish_ostt_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c ostt -n "__fish_ostt_needs_command" -s o -l output -d 'Write transcription to file instead of stdout (record default command)' -r
complete -c ostt -n "__fish_ostt_needs_command" -s p -l process -d 'Enable processing after transcription' -r
complete -c ostt -n "__fish_ostt_needs_command" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_needs_command" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_needs_command" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout (record default command)'
complete -c ostt -n "__fish_ostt_needs_command" -l paste -d 'Paste transcription into the focused app (record default command)'
complete -c ostt -n "__fish_ostt_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_needs_command" -s V -l version -d 'Print version'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "record" -d 'Record audio with real-time visualization (default)'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "r" -d 'Record audio with real-time visualization (default)'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "retry" -d 'Retry transcription of a previous recording'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "transcribe" -d 'Transcribe a pre-recorded audio file'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "t" -d 'Transcribe a pre-recorded audio file'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "replay" -d 'Replay a previous recording using system audio player'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "rp" -d 'Replay a previous recording using system audio player'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "auth" -d 'Manage cloud provider credentials'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "a" -d 'Manage cloud provider credentials'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "model" -d 'Choose and manage cloud or local transcription models'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "history" -d 'View and browse transcription history'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "h" -d 'View and browse transcription history'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "keyword" -d 'Manage keywords for improved transcription accuracy'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "k" -d 'Manage keywords for improved transcription accuracy'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "replace" -d 'Manage deterministic text replace rules'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "config" -d 'Open configuration file in your preferred editor'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "c" -d 'Open configuration file in your preferred editor'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "logs" -d 'Show recent log entries from the application'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "process" -d 'Post-process a transcription from history'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "p" -d 'Post-process a transcription from history'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "launch" -d 'Launch ostt in a popup terminal window'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "l" -d 'Launch ostt in a popup terminal window'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "completions" -d 'Generate shell completion script'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "daemon" -d 'Manage the local model daemon'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "d" -d 'Manage the local model daemon'
complete -c ostt -n "__fish_ostt_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand record" -s o -l output -d 'Write transcription to file instead of stdout' -r
complete -c ostt -n "__fish_ostt_using_subcommand record" -s p -l process -d 'Enable processing after transcription. Optionally specify action ID to skip picker' -r
complete -c ostt -n "__fish_ostt_using_subcommand record" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_using_subcommand record" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand record" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout'
complete -c ostt -n "__fish_ostt_using_subcommand record" -l paste -d 'Paste transcription into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand record" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand r" -s o -l output -d 'Write transcription to file instead of stdout' -r
complete -c ostt -n "__fish_ostt_using_subcommand r" -s p -l process -d 'Enable processing after transcription. Optionally specify action ID to skip picker' -r
complete -c ostt -n "__fish_ostt_using_subcommand r" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_using_subcommand r" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand r" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout'
complete -c ostt -n "__fish_ostt_using_subcommand r" -l paste -d 'Paste transcription into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand retry" -s o -l output -d 'Write transcription to file instead of stdout' -r
complete -c ostt -n "__fish_ostt_using_subcommand retry" -s p -l process -d 'Enable processing after transcription. Optionally specify action ID to skip picker' -r
complete -c ostt -n "__fish_ostt_using_subcommand retry" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_using_subcommand retry" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand retry" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout'
complete -c ostt -n "__fish_ostt_using_subcommand retry" -l paste -d 'Paste transcription into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand retry" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -s o -l output -d 'Write transcription to file instead of stdout' -r
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -s p -l process -d 'Enable processing after transcription. Optionally specify action ID to skip picker' -r
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout'
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -l paste -d 'Paste transcription into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand transcribe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand t" -s o -l output -d 'Write transcription to file instead of stdout' -r
complete -c ostt -n "__fish_ostt_using_subcommand t" -s p -l process -d 'Enable processing after transcription. Optionally specify action ID to skip picker' -r
complete -c ostt -n "__fish_ostt_using_subcommand t" -s m -l model -d 'Override transcription model for this run' -r
complete -c ostt -n "__fish_ostt_using_subcommand t" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand t" -s c -l clipboard -d 'Copy transcription to clipboard instead of stdout'
complete -c ostt -n "__fish_ostt_using_subcommand t" -l paste -d 'Paste transcription into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand replay" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand replay" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand rp" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand rp" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -f -a "login" -d 'Add or update a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -f -a "logout" -d 'Remove a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -f -a "list" -d 'List authenticated providers'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -f -a "status" -d 'Show authentication status'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and not __fish_seen_subcommand_from login logout list status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from login" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from logout" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from status" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "login" -d 'Add or update a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Remove a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "list" -d 'List authenticated providers'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show authentication status'
complete -c ostt -n "__fish_ostt_using_subcommand auth; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -f -a "login" -d 'Add or update a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -f -a "logout" -d 'Remove a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -f -a "list" -d 'List authenticated providers'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -f -a "status" -d 'Show authentication status'
complete -c ostt -n "__fish_ostt_using_subcommand a; and not __fish_seen_subcommand_from login logout list status help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from login" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from login" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from logout" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from logout" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from status" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from help" -f -a "login" -d 'Add or update a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from help" -f -a "logout" -d 'Remove a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from help" -f -a "list" -d 'List authenticated providers'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show authentication status'
complete -c ostt -n "__fish_ostt_using_subcommand a; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "list" -d 'List available transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "current" -d 'Show the currently selected transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "params" -d 'List supported transcription params for a transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "select" -d 'Select the active transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "local" -d 'Manage local transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand model; and not __fish_seen_subcommand_from list current params select local help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from list" -l provider -d 'Filter by provider ID' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from list" -l installed -d 'Show only downloaded local models'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from current" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from current" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from params" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from params" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from params" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from select" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from select" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from local" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from local" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from local" -f -a "download" -d 'Download a local model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from local" -f -a "remove" -d 'Remove a downloaded local model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from local" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "current" -d 'Show the currently selected transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "params" -d 'List supported transcription params for a transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "select" -d 'Select the active transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "local" -d 'Manage local transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand model; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -f -a "list" -d 'List transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -f -a "show" -d 'Show a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -f -a "copy" -d 'Copy a transcription from history to clipboard'
complete -c ostt -n "__fish_ostt_using_subcommand history; and not __fish_seen_subcommand_from list show copy help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from list" -l limit -d 'Limit to N most recent entries' -r
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from show" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from copy" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from copy" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from help" -f -a "list" -d 'List transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from help" -f -a "copy" -d 'Copy a transcription from history to clipboard'
complete -c ostt -n "__fish_ostt_using_subcommand history; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -f -a "list" -d 'List transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -f -a "show" -d 'Show a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -f -a "copy" -d 'Copy a transcription from history to clipboard'
complete -c ostt -n "__fish_ostt_using_subcommand h; and not __fish_seen_subcommand_from list show copy help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from list" -l limit -d 'Limit to N most recent entries' -r
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from show" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from copy" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from copy" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from help" -f -a "list" -d 'List transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from help" -f -a "copy" -d 'Copy a transcription from history to clipboard'
complete -c ostt -n "__fish_ostt_using_subcommand h; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -f -a "list" -d 'List transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -f -a "add" -d 'Add transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -f -a "remove" -d 'Remove transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and not __fish_seen_subcommand_from list add remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from add" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from remove" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from help" -f -a "list" -d 'List transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand keyword; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -f -a "list" -d 'List transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -f -a "add" -d 'Add transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -f -a "remove" -d 'Remove transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and not __fish_seen_subcommand_from list add remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from list" -l format -d 'Output format' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from list" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from add" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from remove" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from help" -f -a "list" -d 'List transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand k; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand replace" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand replace" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand config; and not __fish_seen_subcommand_from path list-devices help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand config; and not __fish_seen_subcommand_from path list-devices help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand config; and not __fish_seen_subcommand_from path list-devices help" -f -a "path" -d 'Print the config file path'
complete -c ostt -n "__fish_ostt_using_subcommand config; and not __fish_seen_subcommand_from path list-devices help" -f -a "list-devices" -d 'List audio input devices for config selection'
complete -c ostt -n "__fish_ostt_using_subcommand config; and not __fish_seen_subcommand_from path list-devices help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from path" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from list-devices" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from list-devices" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "path" -d 'Print the config file path'
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "list-devices" -d 'List audio input devices for config selection'
complete -c ostt -n "__fish_ostt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand c; and not __fish_seen_subcommand_from path list-devices help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand c; and not __fish_seen_subcommand_from path list-devices help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand c; and not __fish_seen_subcommand_from path list-devices help" -f -a "path" -d 'Print the config file path'
complete -c ostt -n "__fish_ostt_using_subcommand c; and not __fish_seen_subcommand_from path list-devices help" -f -a "list-devices" -d 'List audio input devices for config selection'
complete -c ostt -n "__fish_ostt_using_subcommand c; and not __fish_seen_subcommand_from path list-devices help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from path" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from list-devices" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from list-devices" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from help" -f -a "path" -d 'Print the config file path'
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from help" -f -a "list-devices" -d 'List audio input devices for config selection'
complete -c ostt -n "__fish_ostt_using_subcommand c; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and not __fish_seen_subcommand_from follow path help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand logs; and not __fish_seen_subcommand_from follow path help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and not __fish_seen_subcommand_from follow path help" -f -a "follow" -d 'Follow the latest log file'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and not __fish_seen_subcommand_from follow path help" -f -a "path" -d 'Print the latest log file path'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and not __fish_seen_subcommand_from follow path help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from follow" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from follow" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from path" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "follow" -d 'Follow the latest log file'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "path" -d 'Print the latest log file path'
complete -c ostt -n "__fish_ostt_using_subcommand logs; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand process" -s o -l output -d 'Write result to file instead of stdout (shadows global -o)' -r
complete -c ostt -n "__fish_ostt_using_subcommand process" -l format -d 'Output format for `ostt process list`' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand process" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand process" -s c -l clipboard -d 'Copy result to clipboard instead of stdout (shadows global -c)'
complete -c ostt -n "__fish_ostt_using_subcommand process" -l paste -d 'Paste result into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand process" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand p" -s o -l output -d 'Write result to file instead of stdout (shadows global -o)' -r
complete -c ostt -n "__fish_ostt_using_subcommand p" -l format -d 'Output format for `ostt process list`' -r -f -a "table\t''
json\t''"
complete -c ostt -n "__fish_ostt_using_subcommand p" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand p" -s c -l clipboard -d 'Copy result to clipboard instead of stdout (shadows global -c)'
complete -c ostt -n "__fish_ostt_using_subcommand p" -l paste -d 'Paste result into the focused app'
complete -c ostt -n "__fish_ostt_using_subcommand p" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand launch" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand launch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand l" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and not __fish_seen_subcommand_from install help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand completions; and not __fish_seen_subcommand_from install help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and not __fish_seen_subcommand_from install help" -a "install" -d 'Install completions to the standard system directory'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and not __fish_seen_subcommand_from install help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and __fish_seen_subcommand_from install" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand completions; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install completions to the standard system directory'
complete -c ostt -n "__fish_ostt_using_subcommand completions; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "start" -d 'Start the daemon for the active local model'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "stop" -d 'Stop the running daemon'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "restart" -d 'Restart the daemon with the currently active local model'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "status" -d 'Show daemon status (running, model, PID, service)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "install" -d 'Install daemon as a login service (auto-start on login)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "uninstall" -d 'Remove the daemon login service'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "run" -d '[Internal] Run the daemon process — used by the service manager and daemon start'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from start" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from stop" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from restart" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from restart" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from status" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from install" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from uninstall" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from run" -l model-id -d 'Model ID to load (defaults to the currently active local model)' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from run" -l idle-timeout-secs -d 'Exit after this many seconds of inactivity (omit for no timeout)' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from run" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start the daemon for the active local model'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop the running daemon'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "restart" -d 'Restart the daemon with the currently active local model'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show daemon status (running, model, PID, service)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install daemon as a login service (auto-start on login)'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Remove the daemon login service'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "run" -d '[Internal] Run the daemon process — used by the service manager and daemon start'
complete -c ostt -n "__fish_ostt_using_subcommand daemon; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "start" -d 'Start the daemon for the active local model'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "stop" -d 'Stop the running daemon'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "restart" -d 'Restart the daemon with the currently active local model'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "status" -d 'Show daemon status (running, model, PID, service)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "install" -d 'Install daemon as a login service (auto-start on login)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "uninstall" -d 'Remove the daemon login service'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "run" -d '[Internal] Run the daemon process — used by the service manager and daemon start'
complete -c ostt -n "__fish_ostt_using_subcommand d; and not __fish_seen_subcommand_from start stop restart status install uninstall run help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from start" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from stop" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from stop" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from restart" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from restart" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from status" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from status" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from install" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from uninstall" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from run" -l model-id -d 'Model ID to load (defaults to the currently active local model)' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from run" -l idle-timeout-secs -d 'Exit after this many seconds of inactivity (omit for no timeout)' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from run" -l param -d 'Override a transcription param for this run, as key=value' -r
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start the daemon for the active local model'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "stop" -d 'Stop the running daemon'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "restart" -d 'Restart the daemon with the currently active local model'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "status" -d 'Show daemon status (running, model, PID, service)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "install" -d 'Install daemon as a login service (auto-start on login)'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Remove the daemon login service'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "run" -d '[Internal] Run the daemon process — used by the service manager and daemon start'
complete -c ostt -n "__fish_ostt_using_subcommand d; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "record" -d 'Record audio with real-time visualization (default)'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "retry" -d 'Retry transcription of a previous recording'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "transcribe" -d 'Transcribe a pre-recorded audio file'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "replay" -d 'Replay a previous recording using system audio player'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "auth" -d 'Manage cloud provider credentials'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "model" -d 'Choose and manage cloud or local transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "history" -d 'View and browse transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "keyword" -d 'Manage keywords for improved transcription accuracy'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "replace" -d 'Manage deterministic text replace rules'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "config" -d 'Open configuration file in your preferred editor'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "logs" -d 'Show recent log entries from the application'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "process" -d 'Post-process a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "launch" -d 'Launch ostt in a popup terminal window'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "completions" -d 'Generate shell completion script'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "daemon" -d 'Manage the local model daemon'
complete -c ostt -n "__fish_ostt_using_subcommand help; and not __fish_seen_subcommand_from record retry transcribe replay auth model history keyword replace config logs process launch completions daemon help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "login" -d 'Add or update a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "logout" -d 'Remove a cloud provider credential'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "list" -d 'List authenticated providers'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from auth" -f -a "status" -d 'Show authentication status'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from model" -f -a "list" -d 'List available transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from model" -f -a "current" -d 'Show the currently selected transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from model" -f -a "params" -d 'List supported transcription params for a transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from model" -f -a "select" -d 'Select the active transcription model'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from model" -f -a "local" -d 'Manage local transcription models'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from history" -f -a "list" -d 'List transcription history'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from history" -f -a "show" -d 'Show a transcription from history'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from history" -f -a "copy" -d 'Copy a transcription from history to clipboard'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from keyword" -f -a "list" -d 'List transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from keyword" -f -a "add" -d 'Add transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from keyword" -f -a "remove" -d 'Remove transcription keywords'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "path" -d 'Print the config file path'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "list-devices" -d 'List audio input devices for config selection'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "follow" -d 'Follow the latest log file'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from logs" -f -a "path" -d 'Print the latest log file path'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from completions" -f -a "install" -d 'Install completions to the standard system directory'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "start" -d 'Start the daemon for the active local model'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "stop" -d 'Stop the running daemon'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "restart" -d 'Restart the daemon with the currently active local model'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "status" -d 'Show daemon status (running, model, PID, service)'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "install" -d 'Install daemon as a login service (auto-start on login)'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "uninstall" -d 'Remove the daemon login service'
complete -c ostt -n "__fish_ostt_using_subcommand help; and __fish_seen_subcommand_from daemon" -f -a "run" -d '[Internal] Run the daemon process — used by the service manager and daemon start'
