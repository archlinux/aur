# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_herdr_global_optspecs
	string join \n h/help no-session session= remote= remote-keybindings= handoff default-config skill V/version
end

function __fish_herdr_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_herdr_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_herdr_using_subcommand
	set -l cmd (__fish_herdr_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c herdr -n "__fish_herdr_needs_command" -l session -d 'Use or create a named persistent session' -r
complete -c herdr -n "__fish_herdr_needs_command" -l remote -d 'Attach through SSH to a remote Herdr server' -r
complete -c herdr -n "__fish_herdr_needs_command" -l remote-keybindings -d 'Choose local or server keybindings for remote attach' -r -f -a "local\t''
server\t''"
complete -c herdr -n "__fish_herdr_needs_command" -s h -l help -d 'Show help'
complete -c herdr -n "__fish_herdr_needs_command" -l no-session -d 'Run monolithically without server/client session mode'
complete -c herdr -n "__fish_herdr_needs_command" -l handoff -d 'Opt into live handoff for update or remote attach'
complete -c herdr -n "__fish_herdr_needs_command" -l default-config -d 'Print default configuration and exit'
complete -c herdr -n "__fish_herdr_needs_command" -l skill -d 'Print the agent skill file and exit'
complete -c herdr -n "__fish_herdr_needs_command" -s V -l version -d 'Print version and exit'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "completion" -d 'Generate shell completion scripts'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "completions" -d 'Generate shell completion scripts'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "update" -d 'Download and install the latest version'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "status" -d 'Show local client and running server status'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "config" -d 'Manage local configuration'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "channel" -d 'Manage stable and preview update channels'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "server" -d 'Run or control the headless server'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "api" -d 'Inspect socket API metadata and live runtime state'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "workspace" -d 'Manage workspaces over the socket API'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "worktree" -d 'Manage Git worktree-backed workspaces'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "tab" -d 'Manage tabs over the socket API'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "notification" -d 'Show Herdr notifications'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "agent" -d 'Control and inspect agent panes'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "pane" -d 'Control terminal panes'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "terminal" -d 'Attach to or observe raw terminal streams'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "session" -d 'Manage named persistent sessions'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "integration" -d 'Manage built-in agent integrations'
complete -c herdr -n "__fish_herdr_needs_command" -f -a "plugin" -d 'Install and run workflow plugins'
complete -c herdr -n "__fish_herdr_using_subcommand update" -l handoff -d 'Try live handoff after installing'
complete -c herdr -n "__fish_herdr_using_subcommand status; and not __fish_seen_subcommand_from server client" -l json
complete -c herdr -n "__fish_herdr_using_subcommand status; and not __fish_seen_subcommand_from server client" -f -a "server" -d 'Show running server status'
complete -c herdr -n "__fish_herdr_using_subcommand status; and not __fish_seen_subcommand_from server client" -f -a "client" -d 'Show local client status'
complete -c herdr -n "__fish_herdr_using_subcommand status; and __fish_seen_subcommand_from server" -l json
complete -c herdr -n "__fish_herdr_using_subcommand status; and __fish_seen_subcommand_from client" -l json
complete -c herdr -n "__fish_herdr_using_subcommand config; and not __fish_seen_subcommand_from check reset-keys" -f -a "check" -d 'Validate config.toml and print diagnostics'
complete -c herdr -n "__fish_herdr_using_subcommand config; and not __fish_seen_subcommand_from check reset-keys" -f -a "reset-keys" -d 'Reset custom keybindings'
complete -c herdr -n "__fish_herdr_using_subcommand channel; and not __fish_seen_subcommand_from show set" -f -a "show" -d 'Print the configured update channel'
complete -c herdr -n "__fish_herdr_using_subcommand channel; and not __fish_seen_subcommand_from show set" -f -a "set" -d 'Choose the update channel'
complete -c herdr -n "__fish_herdr_using_subcommand server; and not __fish_seen_subcommand_from stop reload-config agent-manifests update-agent-manifests reload-agent-manifests" -f -a "stop" -d 'Stop the running server'
complete -c herdr -n "__fish_herdr_using_subcommand server; and not __fish_seen_subcommand_from stop reload-config agent-manifests update-agent-manifests reload-agent-manifests" -f -a "reload-config" -d 'Reload config in the running server'
complete -c herdr -n "__fish_herdr_using_subcommand server; and not __fish_seen_subcommand_from stop reload-config agent-manifests update-agent-manifests reload-agent-manifests" -f -a "agent-manifests" -d 'Show active agent detection manifests'
complete -c herdr -n "__fish_herdr_using_subcommand server; and not __fish_seen_subcommand_from stop reload-config agent-manifests update-agent-manifests reload-agent-manifests" -f -a "update-agent-manifests" -d 'Fetch and reload agent detection manifests'
complete -c herdr -n "__fish_herdr_using_subcommand server; and not __fish_seen_subcommand_from stop reload-config agent-manifests update-agent-manifests reload-agent-manifests" -f -a "reload-agent-manifests" -d 'Reload local agent detection manifest overrides'
complete -c herdr -n "__fish_herdr_using_subcommand server; and __fish_seen_subcommand_from agent-manifests" -l json
complete -c herdr -n "__fish_herdr_using_subcommand server; and __fish_seen_subcommand_from update-agent-manifests" -l json
complete -c herdr -n "__fish_herdr_using_subcommand api; and not __fish_seen_subcommand_from snapshot schema" -f -a "snapshot" -d 'Print the live session snapshot'
complete -c herdr -n "__fish_herdr_using_subcommand api; and not __fish_seen_subcommand_from snapshot schema" -f -a "schema" -d 'Print or write the bundled API schema'
complete -c herdr -n "__fish_herdr_using_subcommand api; and __fish_seen_subcommand_from schema" -l output -r -F
complete -c herdr -n "__fish_herdr_using_subcommand api; and __fish_seen_subcommand_from schema" -l json
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "list" -d 'List workspaces'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "create" -d 'Create a workspace'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "get" -d 'Show a workspace'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "focus" -d 'Focus a workspace'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "rename" -d 'Rename a workspace'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "report-metadata" -d 'Report display-only workspace metadata'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and not __fish_seen_subcommand_from list create get focus rename report-metadata close" -f -a "close" -d 'Close a workspace'
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from create" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from create" -l label -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from create" -l env -d 'Set an environment variable for the launched process' -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from create" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from create" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from report-metadata" -l source -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from report-metadata" -l token -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from report-metadata" -l clear-token -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from report-metadata" -l seq -r
complete -c herdr -n "__fish_herdr_using_subcommand workspace; and __fish_seen_subcommand_from report-metadata" -l ttl-ms -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and not __fish_seen_subcommand_from list create open remove" -f -a "list" -d 'List worktree workspaces'
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and not __fish_seen_subcommand_from list create open remove" -f -a "create" -d 'Create and open a Git worktree'
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and not __fish_seen_subcommand_from list create open remove" -f -a "open" -d 'Open an existing Git worktree'
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and not __fish_seen_subcommand_from list create open remove" -f -a "remove" -d 'Remove a worktree checkout'
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from list" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from list" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l branch -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l base -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l path -r -F
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l label -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from create" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l path -r -F
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l branch -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l label -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from open" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from remove" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand worktree; and __fish_seen_subcommand_from remove" -l force
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "list" -d 'List tabs'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "create" -d 'Create a tab'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "get" -d 'Show a tab'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "focus" -d 'Focus a tab'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "rename" -d 'Rename a tab'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and not __fish_seen_subcommand_from list create get focus rename close" -f -a "close" -d 'Close a tab'
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from list" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l label -r
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l env -d 'Set an environment variable for the launched process' -r
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand tab; and __fish_seen_subcommand_from create" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand notification; and not __fish_seen_subcommand_from show" -f -a "show" -d 'Show a notification'
complete -c herdr -n "__fish_herdr_using_subcommand notification; and __fish_seen_subcommand_from show" -l body -r
complete -c herdr -n "__fish_herdr_using_subcommand notification; and __fish_seen_subcommand_from show" -l position -r -f -a "top-left\t''
top-right\t''
bottom-left\t''
bottom-right\t''"
complete -c herdr -n "__fish_herdr_using_subcommand notification; and __fish_seen_subcommand_from show" -l sound -r -f -a "none\t''
done\t''
request\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "list" -d 'List agents'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "get" -d 'Show an agent'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "read" -d 'Read agent terminal output'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "send-keys" -d 'Send key presses to an agent'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "prompt" -d 'Submit a prompt to an agent'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "rename" -d 'Rename an agent'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "focus" -d 'Focus an agent'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "wait" -d 'Wait until an agent reaches one of the requested states'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "attach" -d 'Attach directly to an agent terminal'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "start" -d 'Start a supported interactive agent in an existing pane'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and not __fish_seen_subcommand_from list get read send-keys prompt rename focus wait attach start explain" -f -a "explain" -d 'Explain agent detection state'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from read" -l source -d 'Terminal snapshot source (default: recent)' -r -f -a "visible\t''
recent\t''
recent-unwrapped\t''
detection\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from read" -l lines -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from read" -l format -r -f -a "text\t''
ansi\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from read" -l ansi
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from prompt" -l until -d 'State to match after --wait; repeat for more than one state' -r -f -a "idle\t''
working\t''
blocked\t''
done\t''
unknown\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from prompt" -l timeout -d 'Fail after this many milliseconds' -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from prompt" -l wait -d 'Wait for the first matching state observed after submission'
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from rename" -l clear
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from wait" -l until -d 'State to match; repeat for more than one state' -r -f -a "idle\t''
working\t''
blocked\t''
done\t''
unknown\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from wait" -l timeout -d 'Fail after this many milliseconds' -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from attach" -l takeover
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from start" -l kind -d 'Supported agent kind and canonical executable' -r -f -a "pi\t''
claude\t''
codex\t''
gemini\t''
cursor\t''
devin\t''
agy\t''
cline\t''
omp\t''
mastracode\t''
opencode\t''
copilot\t''
kimi\t''
kiro\t''
droid\t''
amp\t''
grok\t''
hermes\t''
kilo\t''
qodercli\t''
qwen\t''
maki\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from start" -l pane -d 'Existing pane at an interactive shell prompt' -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from start" -l timeout -d 'Wait for interactive readiness (default: 30000; max: 300000)' -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from explain" -l file -r -F
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from explain" -l agent -r
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from explain" -l format -r -f -a "text\t''
json\t''"
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from explain" -l json
complete -c herdr -n "__fish_herdr_using_subcommand agent; and __fish_seen_subcommand_from explain" -s v -l verbose
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "list" -d 'List panes'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "current" -d 'Show the current pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "get" -d 'Show a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "layout" -d 'Show pane layout information'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "process-info" -d 'Show pane process information'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "neighbor" -d 'Find a pane neighbor'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "edges" -d 'Show pane edge information'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "focus" -d 'Focus a neighboring pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "resize" -d 'Resize a pane split'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "zoom" -d 'Toggle or set pane zoom'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "read" -d 'Read pane terminal output'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "rename" -d 'Rename a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "input" -d 'Set pane input routing'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "split" -d 'Split a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "swap" -d 'Swap panes'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "move" -d 'Move a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "close" -d 'Close a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "send-text" -d 'Send literal text to a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "send-keys" -d 'Send key presses to a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "wait-output" -d 'Wait for matching pane output'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "run" -d 'Run a command in a pane'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "report-agent" -d 'Report pane agent lifecycle state'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "report-agent-session" -d 'Report pane agent session identity'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "release-agent" -d 'Release pane agent lifecycle authority'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and not __fish_seen_subcommand_from list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata" -f -a "report-metadata" -d 'Report display-only pane metadata'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from list" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from current" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from current" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from layout" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from layout" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from process-info" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from process-info" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from neighbor" -l direction -r -f -a "left\t''
right\t''
up\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from neighbor" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from neighbor" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from edges" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from edges" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from focus" -l direction -r -f -a "left\t''
right\t''
up\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from focus" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from focus" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from resize" -l direction -r -f -a "left\t''
right\t''
up\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from resize" -l amount -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from resize" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from resize" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from zoom" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from zoom" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from zoom" -l toggle
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from zoom" -l on
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from zoom" -l off
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from read" -l source -d 'Terminal snapshot source (default: recent)' -r -f -a "visible\t''
recent\t''
recent-unwrapped\t''
detection\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from read" -l lines -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from read" -l format -r -f -a "text\t''
ansi\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from read" -l ansi
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from read" -l raw
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from rename" -l clear
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from input" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from input" -l right-click -r -f -a "herdr\t''
pane\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from input" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l direction -r -f -a "right\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l ratio -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l cwd -r -F
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l env -d 'Set an environment variable for the launched process' -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l right-click -r -f -a "herdr\t''
pane\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from split" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from swap" -l direction -r -f -a "left\t''
right\t''
up\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from swap" -l pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from swap" -l source-pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from swap" -l target-pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from swap" -l current
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l tab -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l split -r -f -a "right\t''
down\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l target-pane -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l ratio -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l workspace -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l label -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l tab-label -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l new-tab
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l new-workspace
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l focus
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from move" -l no-focus
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l match -d 'Match a literal substring' -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l regex -d 'Match a Rust regular expression' -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l source -d 'Terminal snapshot source (default: recent)' -r -f -a "visible\t''
recent\t''
recent-unwrapped\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l lines -d 'Restrict the searched snapshot to N lines' -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l timeout -d 'Fail after this many milliseconds' -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from wait-output" -l raw -d 'Keep ANSI escape sequences while matching'
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l agent -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l state -r -f -a "idle\t''
working\t''
blocked\t''
unknown\t''"
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l message -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l seq -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l agent-session-id -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent" -l agent-session-path -r -F
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l agent -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l seq -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l agent-session-id -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l agent-session-path -r -F
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-agent-session" -l session-start-source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from release-agent" -l source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from release-agent" -l agent -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from release-agent" -l seq -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l agent -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l applies-to-source -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l title -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l display-agent -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l state-label -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l token -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l clear-token -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l seq -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l ttl-ms -r
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l clear-title
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l clear-display-agent
complete -c herdr -n "__fish_herdr_using_subcommand pane; and __fish_seen_subcommand_from report-metadata" -l clear-state-labels
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and not __fish_seen_subcommand_from attach session title" -f -a "attach" -d 'Attach directly to a terminal stream'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and not __fish_seen_subcommand_from attach session title" -f -a "session" -d 'Work with terminal sessions'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and not __fish_seen_subcommand_from attach session title" -f -a "title" -d 'Manage the outer terminal title'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and __fish_seen_subcommand_from attach" -l takeover
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and __fish_seen_subcommand_from session" -f -a "control" -d 'Control a terminal stream'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and __fish_seen_subcommand_from session" -f -a "observe" -d 'Observe a terminal stream'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and __fish_seen_subcommand_from title" -f -a "set" -d 'Set the outer terminal title'
complete -c herdr -n "__fish_herdr_using_subcommand terminal; and __fish_seen_subcommand_from title" -f -a "clear" -d 'Clear the outer terminal title'
complete -c herdr -n "__fish_herdr_using_subcommand session; and not __fish_seen_subcommand_from list attach stop delete" -f -a "list" -d 'List sessions'
complete -c herdr -n "__fish_herdr_using_subcommand session; and not __fish_seen_subcommand_from list attach stop delete" -f -a "attach" -d 'Attach to a session'
complete -c herdr -n "__fish_herdr_using_subcommand session; and not __fish_seen_subcommand_from list attach stop delete" -f -a "stop" -d 'Stop a session'
complete -c herdr -n "__fish_herdr_using_subcommand session; and not __fish_seen_subcommand_from list attach stop delete" -f -a "delete" -d 'Delete a stopped session'
complete -c herdr -n "__fish_herdr_using_subcommand session; and __fish_seen_subcommand_from list" -l json
complete -c herdr -n "__fish_herdr_using_subcommand session; and __fish_seen_subcommand_from stop" -l json
complete -c herdr -n "__fish_herdr_using_subcommand session; and __fish_seen_subcommand_from delete" -l json
complete -c herdr -n "__fish_herdr_using_subcommand integration; and not __fish_seen_subcommand_from install uninstall status" -f -a "install" -d 'Install an integration'
complete -c herdr -n "__fish_herdr_using_subcommand integration; and not __fish_seen_subcommand_from install uninstall status" -f -a "uninstall" -d 'Uninstall an integration'
complete -c herdr -n "__fish_herdr_using_subcommand integration; and not __fish_seen_subcommand_from install uninstall status" -f -a "status" -d 'Show integration status'
complete -c herdr -n "__fish_herdr_using_subcommand integration; and __fish_seen_subcommand_from status" -l outdated-only
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "install" -d 'Install a plugin from GitHub'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "uninstall" -d 'Uninstall a plugin'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "link" -d 'Link a local plugin'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "unlink" -d 'Unlink a local plugin'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "enable" -d 'Enable a plugin'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "disable" -d 'Disable a plugin'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "list" -d 'List installed plugins'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "config-dir" -d 'Print a plugin config directory'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "action" -d 'List or invoke plugin actions'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "log" -d 'Inspect plugin command logs'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "logs" -d 'Inspect plugin command logs'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and not __fish_seen_subcommand_from install uninstall link unlink enable disable list config-dir action log logs pane" -f -a "pane" -d 'Manage plugin-owned panes'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from install" -l ref -r
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from install" -s y -l yes
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from link" -l disabled
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from link" -l enabled
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from list" -l plugin -r
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from list" -l json
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from action" -f -a "list" -d 'List plugin actions'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from action" -f -a "invoke" -d 'Invoke a plugin action'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from log" -f -a "list" -d 'List plugin command logs'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from logs" -f -a "list" -d 'List plugin command logs'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from pane" -f -a "open" -d 'Open a plugin pane'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from pane" -f -a "focus" -d 'Focus a plugin pane'
complete -c herdr -n "__fish_herdr_using_subcommand plugin; and __fish_seen_subcommand_from pane" -f -a "close" -d 'Close a plugin pane'
