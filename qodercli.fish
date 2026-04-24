# fish completion for qodercli
# Generated manually based on qodercli --help

# Disable file completions by default
complete -c qodercli -f

# --- Helper conditions ---
function __qodercli_no_subcommand
    set -l cmd (commandline -opc)
    for word in $cmd[2..]
        switch $word
            case commit jobs rm feedback help install mcp status update
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
complete -c qodercli -n __qodercli_no_subcommand -a commit -d 'Commit AI-generated code and record AI contribution statistics'
complete -c qodercli -n __qodercli_no_subcommand -a jobs -d 'List concurrent job(s)'
complete -c qodercli -n __qodercli_no_subcommand -a rm -d 'Remove concurrent job(s)'
complete -c qodercli -n __qodercli_no_subcommand -a feedback -d 'Submit feedback with optional images'
complete -c qodercli -n __qodercli_no_subcommand -a help -d 'Help about any command'
complete -c qodercli -n __qodercli_no_subcommand -a install -d 'Install qodercli to the standard location'
complete -c qodercli -n __qodercli_no_subcommand -a mcp -d 'Manage MCP servers'
complete -c qodercli -n __qodercli_no_subcommand -a status -d 'Show account and CLI status'
complete -c qodercli -n __qodercli_no_subcommand -a update -d 'Self-update to the latest release'

# === Top-level flags ===
complete -c qodercli -n __qodercli_no_subcommand -s h -l help -d 'Show help'
complete -c qodercli -n __qodercli_no_subcommand -s v -l version -d 'Show version'
complete -c qodercli -n __qodercli_no_subcommand -s c -l continue -d 'Continue the most recent conversation'
complete -c qodercli -n __qodercli_no_subcommand -s p -l print -r -d 'Print response and exit'
complete -c qodercli -n __qodercli_no_subcommand -s q -l quiet -d 'Hide spinner in non-interactive mode'
complete -c qodercli -n __qodercli_no_subcommand -s r -l resume -r -d 'Resume a conversation by session ID'
complete -c qodercli -n __qodercli_no_subcommand -s f -l output-format -r -a 'text json stream-json' -d 'Output format for non-interactive mode'
complete -c qodercli -n __qodercli_no_subcommand -s w -l workspace -r -F -d 'Current working directory'
complete -c qodercli -n __qodercli_no_subcommand -l agents -r -d 'JSON object defining custom agents'
complete -c qodercli -n __qodercli_no_subcommand -l allowed-tools -r -d 'Allowed tool names'
complete -c qodercli -n __qodercli_no_subcommand -l attachment -r -F -d 'Attachment path'
complete -c qodercli -n __qodercli_no_subcommand -l branch -r -d 'Branch name (only works with --worktree)'
complete -c qodercli -n __qodercli_no_subcommand -l dangerously-skip-permissions -d 'Bypass all permission checks'
complete -c qodercli -n __qodercli_no_subcommand -l disallowed-tools -r -d 'Disallowed tool names'
complete -c qodercli -n __qodercli_no_subcommand -l experimental-mcp-load -d 'Enable dynamic discovery and loading of tools from MCP servers'
complete -c qodercli -n __qodercli_no_subcommand -l summarize-tool -r -d 'Tool patterns to auto-summarize outputs'
complete -c qodercli -n __qodercli_no_subcommand -l input-format -r -a 'text stream-json' -d 'Input format for non-interactive mode'
complete -c qodercli -n __qodercli_no_subcommand -l max-output-tokens -r -a '16k 32k' -d 'Max tokens for model output'
complete -c qodercli -n __qodercli_no_subcommand -l max-turns -r -d 'Maximum agent loop cycles'
complete -c qodercli -n __qodercli_no_subcommand -l model -r -a 'auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate' -d 'Model level for the session'
complete -c qodercli -n __qodercli_no_subcommand -l path -r -F -d 'Worktree path (only works with --worktree)'
complete -c qodercli -n __qodercli_no_subcommand -l with-claude-config -d 'Load claude code configurations'
complete -c qodercli -n __qodercli_no_subcommand -l worktree -d 'Start a concurrent job via git worktree'
complete -c qodercli -n __qodercli_no_subcommand -l yolo -d 'Bypass all permission checks'

# === jobs ===
complete -c qodercli -n '__qodercli_using_subcommand jobs' -s a -l all -d 'Show all concurrent jobs'
complete -c qodercli -n '__qodercli_using_subcommand jobs' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand jobs' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand jobs' -s w -l workspace -r -F -d 'Current working directory'

# === rm ===
complete -c qodercli -n '__qodercli_using_subcommand rm' -s f -l force -d 'Force remove a running job'
complete -c qodercli -n '__qodercli_using_subcommand rm' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand rm' -l kubeconfig -r -F -d 'Kubeconfig of the kubernetes job'
complete -c qodercli -n '__qodercli_using_subcommand rm' -l namespace -r -d 'Namespace of the kubernetes job'
complete -c qodercli -n '__qodercli_using_subcommand rm' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand rm' -s w -l workspace -r -F -d 'Current working directory'

# === feedback ===
complete -c qodercli -n '__qodercli_using_subcommand feedback' -l caller-version -r -d 'Caller application version'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s c -l content -r -d 'Feedback content'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -l email -r -d 'Contact email address'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s i -l images -r -F -d 'Image file paths'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -l json -d 'Output result in JSON format'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s s -l session -r -d 'Session ID'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -l workdir -r -F -d 'Working directory'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand feedback' -s w -l workspace -r -F -d 'Current working directory'

# === commit ===
complete -c qodercli -n '__qodercli_using_subcommand commit' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand commit' -s m -l message -r -d 'Commit message'
complete -c qodercli -n '__qodercli_using_subcommand commit' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand commit' -s w -l workspace -r -F -d 'Working directory'

# === help ===
complete -c qodercli -n '__qodercli_using_subcommand help' -a 'commit jobs rm feedback help install mcp status update' -d 'Command'

# === status ===
complete -c qodercli -n '__qodercli_using_subcommand status' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand status' -s o -l output -r -a 'text json' -d 'Output format'
complete -c qodercli -n '__qodercli_using_subcommand status' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand status' -s w -l workspace -r -F -d 'Current working directory'

# === update (no flags) ===

# === install ===
complete -c qodercli -n '__qodercli_using_subcommand install' -l force -d 'Overwrite existing installation of the same version'
complete -c qodercli -n '__qodercli_using_subcommand install' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand install' -l quiet -d 'Suppress progress output'
complete -c qodercli -n '__qodercli_using_subcommand install' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand install' -s w -l workspace -r -F -d 'Current working directory'

# === mcp subcommands ===
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a add -d 'Add a new MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a auth -d 'Authenticate with an MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a get -d 'Get details of an MCP server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a list -d 'List all MCP servers'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -a remove -d 'Remove an MCP Server'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_subcommand mcp; and __qodercli_mcp_no_subcommand' -s w -l workspace -r -F -d 'Current working directory'

# === mcp add ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s e -l env -r -d 'Set environment variables'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s H -l header -r -d 'Set HTTP headers'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s s -l scope -r -a 'local user project' -d 'Configuration scope'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s t -l transport -r -a 'stdio sse http streamable-http' -d 'Transport type'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand add' -s w -l workspace -r -F -d 'Current working directory'

# === mcp auth ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand auth' -s w -l workspace -r -F -d 'Current working directory'

# === mcp get ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand get' -s w -l workspace -r -F -d 'Current working directory'

# === mcp list ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand list' -s w -l workspace -r -F -d 'Current working directory'

# === mcp remove ===
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s s -l scope -r -a 'local user project' -d 'Configuration scope'
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s v -l version -d 'Show version'
complete -c qodercli -n '__qodercli_using_mcp_subcommand remove' -s w -l workspace -r -F -d 'Current working directory'
