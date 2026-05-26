# fish completion for qodercli
# Generated manually based on qodercli --help

# Disable file completions by default
complete -c qodercli -f

# --- Helper conditions ---
function __qodercli_no_subcommand
    set -l cmd (commandline -opc)
    for word in $cmd[2..]
        switch $word
            case mcp plugins plugin skills skill hooks hook agents agent login commit rollback update external remote-control status feedback wiki
                return 1
        end
    end
    return 0
end

function __qodercli_using_subcommand
    set -l cmd (commandline -opc)
    for word in $cmd[2..]
        if test "$word" = "$argv[1]"
            return 0
        end
    end
    return 1
end

function __qodercli_using_mcp_subcommand
    set -l cmd (commandline -opc)
    set -l found_mcp 0
    for word in $cmd[2..]
        if test "$word" = mcp
            set found_mcp 1
        else if test $found_mcp -eq 1
            switch $word
                case add auth get list remove
                    if test "$word" = "$argv[1]"
                        return 0
                    end
            end
        end
    end
    return 1
end

function __qodercli_mcp_no_subcommand
    set -l cmd (commandline -opc)
    set -l found_mcp 0
    for word in $cmd[2..]
        if test "$word" = mcp
            set found_mcp 1
        else if test $found_mcp -eq 1
            switch $word
                case add auth get list remove
                    return 1
            end
        end
    end
    return 0
end

# === Top-level subcommands ===
complete -c qodercli -n __qodercli_no_subcommand -a mcp -d 'Configure and manage MCP servers'
complete -c qodercli -n __qodercli_no_subcommand -a plugins -d 'Manage plugins'
complete -c qodercli -n __qodercli_no_subcommand -a plugin -d 'Manage plugins'
complete -c qodercli -n __qodercli_no_subcommand -a skills -d 'Manage agent skills'
complete -c qodercli -n __qodercli_no_subcommand -a skill -d 'Manage agent skills'
complete -c qodercli -n __qodercli_no_subcommand -a hooks -d 'Manage hooks'
complete -c qodercli -n __qodercli_no_subcommand -a hook -d 'Manage hooks'
complete -c qodercli -n __qodercli_no_subcommand -a agents -d 'Manage agents'
complete -c qodercli -n __qodercli_no_subcommand -a agent -d 'Manage agents'
complete -c qodercli -n __qodercli_no_subcommand -a login -d 'Sign in to your account'
complete -c qodercli -n __qodercli_no_subcommand -a commit -d 'Generate a commit message and commit changes'
complete -c qodercli -n __qodercli_no_subcommand -a rollback -d 'Rollback to a previous version'
complete -c qodercli -n __qodercli_no_subcommand -a update -d 'Update to the latest version'
complete -c qodercli -n __qodercli_no_subcommand -a external -d 'Manage external commands'
complete -c qodercli -n __qodercli_no_subcommand -a remote-control -d 'Start the remote-control daemon'
complete -c qodercli -n __qodercli_no_subcommand -a status -d 'Show session status'
complete -c qodercli -n __qodercli_no_subcommand -a feedback -d 'Submit feedback'
complete -c qodercli -n __qodercli_no_subcommand -a wiki -d 'Generate wiki documentation for projects'

# === Top-level flags ===
complete -c qodercli -n __qodercli_no_subcommand -s h -l help -d 'Show help'
complete -c qodercli -n __qodercli_no_subcommand -s v -l version -d 'Show version'
complete -c qodercli -n __qodercli_no_subcommand -s d -l debug -d 'Run in debug mode'
complete -c qodercli -n __qodercli_no_subcommand -s m -l model -r -a 'auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate' -d 'Model for the current session'
complete -c qodercli -n __qodercli_no_subcommand -l reasoning-effort -r -d 'Set reasoning effort level'
complete -c qodercli -n __qodercli_no_subcommand -l context-window -r -d 'Explicit context window for supported models'
complete -c qodercli -n __qodercli_no_subcommand -s i -l prompt-interactive -r -d 'Execute prompt and continue in interactive mode'
complete -c qodercli -n __qodercli_no_subcommand -s w -l cwd -r -F -d 'Change working directory before startup'
complete -c qodercli -n __qodercli_no_subcommand -l worktree -r -d 'Start in a new git worktree'
complete -c qodercli -n __qodercli_no_subcommand -l permission-mode -r -a 'default accept_edits bypass_permissions dont_ask plan auto' -d 'Set the permission mode'
complete -c qodercli -n __qodercli_no_subcommand -l dangerously-skip-permissions -d 'Bypass all permission checks'
complete -c qodercli -n __qodercli_no_subcommand -l allowed-mcp-server-names -r -d 'Allowed MCP server names'
complete -c qodercli -n __qodercli_no_subcommand -l tools -r -d 'Restrict the set of available tools'
complete -c qodercli -n __qodercli_no_subcommand -l allowed-tools -r -d 'Tools to allow'
complete -c qodercli -n __qodercli_no_subcommand -l disallowed-tools -r -d 'Tools to deny'
complete -c qodercli -n __qodercli_no_subcommand -l attachment -r -F -d 'Attach files to the initial prompt'
complete -c qodercli -n __qodercli_no_subcommand -l plugin-dir -r -F -d 'Plugin directories to load'
complete -c qodercli -n __qodercli_no_subcommand -s c -l continue -d 'Continue the most recent session'
complete -c qodercli -n __qodercli_no_subcommand -l fork-session -d 'Create a new session from a resumed conversation'
complete -c qodercli -n __qodercli_no_subcommand -s r -l resume -r -d 'Resume a previous session by identifier'
complete -c qodercli -n __qodercli_no_subcommand -s n -l name -r -d 'Set a display name for this session'
complete -c qodercli -n __qodercli_no_subcommand -l session-id -r -d 'Use a specific session ID'
complete -c qodercli -n __qodercli_no_subcommand -l remote -r -d 'Create a cloud remote session'
complete -c qodercli -n __qodercli_no_subcommand -l remote-session -r -d 'Cold-load and attach to an existing remote session'
complete -c qodercli -n __qodercli_no_subcommand -l teleport -r -d 'Load and attach to a remote session'
complete -c qodercli -n __qodercli_no_subcommand -l remote-control -r -d 'Run as a headless remote-control worker'
complete -c qodercli -n __qodercli_no_subcommand -l list-sessions -d 'List available sessions and exit'
complete -c qodercli -n __qodercli_no_subcommand -l delete-session -r -d 'Delete a session by index number'
complete -c qodercli -n __qodercli_no_subcommand -l add-dir -r -F -d 'Additional directories to include in the workspace'
complete -c qodercli -n __qodercli_no_subcommand -s o -l output-format -r -a 'text json stream-json' -d 'The format of the CLI output'
complete -c qodercli -n __qodercli_no_subcommand -l input-format -r -a 'text stream-json' -d 'The format of the CLI input'
complete -c qodercli -n __qodercli_no_subcommand -l max-output-tokens -r -a '16k 32k' -d 'Set maximum model output tokens'
complete -c qodercli -n __qodercli_no_subcommand -s p -l print -d 'Print response and exit (non-interactive)'
complete -c qodercli -n __qodercli_no_subcommand -l agent -r -d 'Agent for the current session'
complete -c qodercli -n __qodercli_no_subcommand -l agents -r -d 'JSON object defining custom agents'
complete -c qodercli -n __qodercli_no_subcommand -l append-system-prompt -r -d 'Append to the default system prompt'
complete -c qodercli -n __qodercli_no_subcommand -l system-prompt -r -d 'System prompt for the session'
complete -c qodercli -n __qodercli_no_subcommand -l output-style -r -d 'Output style for this session'
complete -c qodercli -n __qodercli_no_subcommand -l mcp-config -r -F -d 'Load MCP servers from JSON file(s)'
complete -c qodercli -n __qodercli_no_subcommand -l strict-mcp-config -d 'Only use MCP servers from --mcp-config'
complete -c qodercli -n __qodercli_no_subcommand -l setting-sources -r -d 'Setting sources to load'
complete -c qodercli -n __qodercli_no_subcommand -l settings -r -d 'Load additional settings from a JSON file'

# === mcp subcommands ===
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a add -d 'Add a new MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a auth -d 'Authenticate with an MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a get -d 'Get details of an MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a list -d 'List all MCP servers'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a remove -d 'Remove an MCP Server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s w -l cwd -r -F -d 'Change working directory'

# === mcp add ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s w -l cwd -r -F -d 'Change working directory'

# === mcp auth ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s w -l cwd -r -F -d 'Change working directory'

# === mcp get ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s w -l cwd -r -F -d 'Change working directory'

# === mcp list ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s w -l cwd -r -F -d 'Change working directory'

# === mcp remove ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s w -l cwd -r -F -d 'Change working directory'

# === Other subcommands (common flags) ===
for cmd in plugins plugin skills skill hooks hook agents agent login commit rollback update external remote-control status feedback wiki
    complete -c qodercli -n "__qodercli_using_subcommand $cmd" -s h -l help -d 'Show help'
    complete -c qodercli -n "__qodercli_using_subcommand $cmd" -s v -l version -d 'Show version'
    complete -c qodercli -n "__qodercli_using_subcommand $cmd" -s w -l cwd -r -F -d 'Change working directory'
end