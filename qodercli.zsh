#compdef qodercli
# zsh completion for qodercli
# Generated manually based on qodercli --help

_qodercli() {
    local -a commands mcp_commands

    commands=(
        'mcp:Configure and manage MCP servers'
        'plugins:Manage plugins'
        'plugin:Manage plugins'
        'skills:Manage agent skills'
        'skill:Manage agent skills'
        'hooks:Manage hooks'
        'hook:Manage hooks'
        'agents:Manage agents'
        'agent:Manage agents'
        'login:Sign in to your account'
        'commit:Generate a commit message and commit changes'
        'rollback:Rollback to a previous version'
        'update:Update to the latest version'
        'external:Manage external commands'
        'remote-control:Start the remote-control daemon'
        'status:Show session status'
        'feedback:Submit feedback'
        'wiki:Generate wiki documentation for projects'
    )

    mcp_commands=(
        'add:Add a new MCP server'
        'auth:Authenticate with an MCP server using OAuth'
        'get:Get details of an MCP server'
        'list:List all MCP servers'
        'remove:Remove an MCP Server'
    )

    _arguments -C \
        '(- *)'{-h,--help}'[Show help]' \
        '(- *)'{-v,--version}'[Show version]' \
        {-d,--debug}'[Run in debug mode]' \
        {-m,--model}'[Model for the current session]:model:(auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate)' \
        '--reasoning-effort[Set reasoning effort level]:level:' \
        '--context-window[Explicit context window for supported models]:size:' \
        {-i,--prompt-interactive}'[Execute prompt and continue in interactive mode]:text:' \
        {-w,--cwd}'[Change working directory before startup]:directory:_directories' \
        '--worktree[Start in a new git worktree]:name:' \
        '--permission-mode[Set the permission mode]:mode:(default accept_edits bypass_permissions dont_ask plan auto)' \
        '--dangerously-skip-permissions[Bypass all permission checks]' \
        '--allowed-mcp-server-names[Allowed MCP server names]:names:' \
        '--tools[Restrict the set of available tools]:tools:' \
        '--allowed-tools[Tools to allow]:tools:' \
        '--disallowed-tools[Tools to deny]:tools:' \
        '--attachment[Attach files to the initial prompt]:file:_files' \
        '--plugin-dir[Plugin directories to load]:directory:_directories' \
        {-c,--continue}'[Continue the most recent session]' \
        '--fork-session[Create a new session from a resumed conversation]' \
        {-r,--resume}'[Resume a previous session by identifier]:id:' \
        {-n,--name}'[Set a display name for this session]:name:' \
        '--session-id[Use a specific session ID]:id:' \
        '--remote[Create a cloud remote session and print its access URL]:task:' \
        '--remote-session[Cold-load and attach to an existing remote session]:id:' \
        '--teleport[Load and attach to a remote session]:id:' \
        '--remote-control[Run as a headless remote-control worker]:id:' \
        '--list-sessions[List available sessions and exit]' \
        '--delete-session[Delete a session by index number]:index:' \
        '--add-dir[Additional directories to include in the workspace]:directory:_directories' \
        {-o,--output-format}'[The format of the CLI output]:format:(text json stream-json)' \
        '--input-format[The format of the CLI input]:format:(text stream-json)' \
        '--max-output-tokens[Set maximum model output tokens]:size:(16k 32k)' \
        {-p,--print}'[Print response and exit (non-interactive)]' \
        '--agent[Agent for the current session]:name:' \
        '--agents[JSON object defining custom agents]:json:' \
        '--append-system-prompt[Append to the default system prompt]:text:' \
        '--system-prompt[System prompt for the session]:text:' \
        '--output-style[Output style for this session]:style:' \
        '--mcp-config[Load MCP servers from JSON file(s)]:file:_files' \
        '--strict-mcp-config[Only use MCP servers from --mcp-config]' \
        '--setting-sources[Setting sources to load]:sources:' \
        '--settings[Load additional settings from a JSON file path or inline JSON string]:json:' \
        '1:command:->command' \
        '*::arg:->args' && return

    case $state in
        command)
            _describe -t commands 'qodercli command' commands
            ;;
        args)
            case ${words[1]} in
                mcp)
                    _arguments -C \
                        '(- *)'{-h,--help}'[Show help]' \
                        '(- *)'{-v,--version}'[Show version]' \
                        {-w,--cwd}'[Change working directory before startup]:directory:_directories' \
                        '1:mcp command:->mcp_command' \
                        '*::mcp arg:->mcp_args' && return

                    case $state in
                        mcp_command)
                            _describe -t mcp_commands 'mcp command' mcp_commands
                            ;;
                        mcp_args)
                            case ${words[1]} in
                                add|auth|get|list|remove)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        '(- *)'{-v,--version}'[Show version]' \
                                        {-w,--cwd}'[Change working directory before startup]:directory:_directories'
                                    ;;
                            esac
                            ;;
                    esac
                    ;;
                plugins|plugin|skills|skill|hooks|hook|agents|agent|login|commit|rollback|update|external|remote-control|status|feedback|wiki)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        '(- *)'{-v,--version}'[Show version]' \
                        {-w,--cwd}'[Change working directory before startup]:directory:_directories'
                    ;;
            esac
            ;;
    esac
}

_qodercli "$@"