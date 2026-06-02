#compdef qoderclicn

_qoderclicn() {
    local -a commands options

    commands=(
        'mcp:Configure and manage MCP servers'
        'plugins:Manage plugins'
        'skills:Manage agent skills'
        'hooks:Manage hooks'
        'agents:Manage agents'
        'login:Sign in to your account'
        'commit:Generate a commit message and commit changes'
        'rollback:Rollback to a previous version'
        'update:Update to the latest version'
        'remote-control:Start the remote-control daemon'
        'status:Show session status'
        'feedback:Submit feedback'
    )

    options=(
        '(-d --debug)'{-d,--debug}'[Run in debug mode]'
        '(-m --model)'{-m,--model}'[Model for the current session]:model:'
        '--reasoning-effort[Set reasoning effort level]:level:'
        '--context-window[Explicit context window for supported models]:size:'
        '(-i --prompt-interactive)'{-i,--prompt-interactive}'[Execute prompt and continue in interactive mode]:text:'
        '(-w --cwd)'{-w,--cwd}'[Change working directory before startup]:directory:_directories'
        '--worktree[Start in a new git worktree]:name:'
        '--permission-mode[Set the permission mode]:mode:(default accept_edits bypass_permissions dont_ask plan auto)'
        '--dangerously-skip-permissions[Bypass all permission checks]'
        '--allowed-mcp-server-names[Allowed MCP server names]:name:'
        '--tools[Restrict available built-in tools]:tools:'
        '--allowed-tools[Tools to allow]:tool:'
        '--disallowed-tools[Tools to deny]:tool:'
        '--attachment[Attach files to the initial prompt]:file:_files'
        '--plugin-dir[Plugin directories to load]:directory:_directories'
        '(-c --continue)'{-c,--continue}'[Continue the most recent session]'
        '--fork-session[Create a new session from a resumed conversation]'
        '(-r --resume)'{-r,--resume}'[Resume a previous session by identifier]:id:'
        '(-n --name)'{-n,--name}'[Set a display name for this session]:name:'
        '--session-id[Use a specific session ID]:id:'
        '--remote[Create a cloud remote session]:task:'
        '--remote-session[Cold-load and attach to an existing remote session]:id:'
        '--teleport[Load and attach to a remote session]:id:'
        '--remote-control[Run as a headless remote-control worker]:id:'
        '--list-sessions[List available sessions and exit]'
        '--delete-session[Delete a session by index number]:index:'
        '--add-dir[Additional directories to include]:directory:_directories'
        '(-o --output-format)'{-o,--output-format}'[The format of the CLI output]:format:(text json stream-json)'
        '--input-format[The format of the CLI input]:format:'
        '--max-output-tokens[Set maximum model output tokens]:size:'
        '(-p --print)'{-p,--print}'[Print response and exit (non-interactive)]'
        '--agent[Agent for the current session]:name:'
        '--agents[JSON object defining custom agents]:json:'
        '--append-system-prompt[Append to the default system prompt]:text:'
        '--system-prompt[System prompt for the session]:text:'
        '--output-style[Output style for this session]:style:'
        '--mcp-config[Load MCP servers from JSON file(s) or inline JSON]:config:_files'
        '--strict-mcp-config[Only use MCP servers from --mcp-config]'
        '--setting-sources[Setting sources to load]:source:(user project local)'
        '--settings[Load additional settings from a JSON file or inline JSON]:json:'
        '(-v --version)'{-v,--version}'[Output the version number]'
        '(-h --help)'{-h,--help}'[Display help for command]'
    )

    _arguments -s $options '1: :->command' '*:: :->args'

    case $state in
        command)
            _describe -t commands 'qoderclicn commands' commands
            ;;
    esac
}

_qoderclicn "$@"
