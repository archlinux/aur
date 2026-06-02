# Fish completions for qoderclicn

# Subcommands
complete -c qoderclicn -n __fish_use_subcommand -xa 'mcp' -d 'Configure and manage MCP servers'
complete -c qoderclicn -n __fish_use_subcommand -xa 'plugins' -d 'Manage plugins'
complete -c qoderclicn -n __fish_use_subcommand -xa 'skills' -d 'Manage agent skills'
complete -c qoderclicn -n __fish_use_subcommand -xa 'hooks' -d 'Manage hooks'
complete -c qoderclicn -n __fish_use_subcommand -xa 'agents' -d 'Manage agents'
complete -c qoderclicn -n __fish_use_subcommand -xa 'login' -d 'Sign in to your account'
complete -c qoderclicn -n __fish_use_subcommand -xa 'commit' -d 'Generate a commit message and commit changes'
complete -c qoderclicn -n __fish_use_subcommand -xa 'rollback' -d 'Rollback to a previous version'
complete -c qoderclicn -n __fish_use_subcommand -xa 'update' -d 'Update to the latest version'
complete -c qoderclicn -n __fish_use_subcommand -xa 'remote-control' -d 'Start the remote-control daemon'
complete -c qoderclicn -n __fish_use_subcommand -xa 'status' -d 'Show session status'
complete -c qoderclicn -n __fish_use_subcommand -xa 'feedback' -d 'Submit feedback'

# Options
complete -c qoderclicn -s d -l debug -d 'Run in debug mode'
complete -c qoderclicn -s m -l model -d 'Model for the current session' -r
complete -c qoderclicn -l reasoning-effort -d 'Set reasoning effort level' -r
complete -c qoderclicn -l context-window -d 'Explicit context window' -r
complete -c qoderclicn -s i -l prompt-interactive -d 'Execute prompt and continue interactively' -r
complete -c qoderclicn -s w -l cwd -d 'Change working directory' -ra '(__fish_complete_directories)'
complete -c qoderclicn -l worktree -d 'Start in a new git worktree' -r
complete -c qoderclicn -l permission-mode -d 'Set permission mode' -xa 'default accept_edits bypass_permissions dont_ask plan auto'
complete -c qoderclicn -l dangerously-skip-permissions -d 'Bypass all permission checks'
complete -c qoderclicn -l allowed-mcp-server-names -d 'Allowed MCP server names' -r
complete -c qoderclicn -l tools -d 'Restrict available built-in tools' -r
complete -c qoderclicn -l allowed-tools -d 'Tools to allow' -r
complete -c qoderclicn -l disallowed-tools -d 'Tools to deny' -r
complete -c qoderclicn -l attachment -d 'Attach files to the initial prompt' -ra '(__fish_complete_path)'
complete -c qoderclicn -l plugin-dir -d 'Plugin directories to load' -ra '(__fish_complete_directories)'
complete -c qoderclicn -s c -l continue -d 'Continue the most recent session'
complete -c qoderclicn -l fork-session -d 'Create a new session from a resumed conversation'
complete -c qoderclicn -s r -l resume -d 'Resume a previous session' -r
complete -c qoderclicn -s n -l name -d 'Set a display name for this session' -r
complete -c qoderclicn -l session-id -d 'Use a specific session ID' -r
complete -c qoderclicn -l remote -d 'Create a cloud remote session' -r
complete -c qoderclicn -l remote-session -d 'Attach to an existing remote session' -r
complete -c qoderclicn -l teleport -d 'Load and attach to a remote session' -r
complete -c qoderclicn -l remote-control -d 'Run as headless remote-control worker' -r
complete -c qoderclicn -l list-sessions -d 'List available sessions and exit'
complete -c qoderclicn -l delete-session -d 'Delete a session by index' -r
complete -c qoderclicn -l add-dir -d 'Additional directories to include' -ra '(__fish_complete_directories)'
complete -c qoderclicn -s o -l output-format -d 'CLI output format' -xa 'text json stream-json'
complete -c qoderclicn -l input-format -d 'CLI input format' -r
complete -c qoderclicn -l max-output-tokens -d 'Set maximum model output tokens' -r
complete -c qoderclicn -s p -l print -d 'Print response and exit'
complete -c qoderclicn -l agent -d 'Agent for the current session' -r
complete -c qoderclicn -l agents -d 'JSON object defining custom agents' -r
complete -c qoderclicn -l append-system-prompt -d 'Append to the default system prompt' -r
complete -c qoderclicn -l system-prompt -d 'System prompt for the session' -r
complete -c qoderclicn -l output-style -d 'Output style for this session' -r
complete -c qoderclicn -l mcp-config -d 'Load MCP servers from JSON' -ra '(__fish_complete_path)'
complete -c qoderclicn -l strict-mcp-config -d 'Only use MCP servers from --mcp-config'
complete -c qoderclicn -l setting-sources -d 'Setting sources to load' -xa 'user project local'
complete -c qoderclicn -l settings -d 'Load additional settings from JSON' -r
complete -c qoderclicn -s v -l version -d 'Output the version number'
complete -c qoderclicn -s h -l help -d 'Display help for command'
