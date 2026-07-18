#compdef qodercli
# zsh completion for qodercli
# Generated manually based on qodercli --help

_qodercli() {
    local -a qodercli_commands mcp_commands plugin_commands plugin_marketplace_commands
    local -a skill_commands hook_commands agent_commands

    qodercli_commands=(
        'mcp:Configure and manage MCP servers'
        'plugins:Manage plugins'
        'plugin:Manage plugins'
        'skills:Manage agent skills'
        'skill:Manage agent skills'
        'hooks:Manage hooks'
        'hook:Manage hooks'
        'agents:Manage subagents'
        'agent:Manage subagents'
        'login:Sign in to your account'
        'commit:Generate a commit message and commit changes'
        'rollback:Rollback to a previous version'
        'update:Update to the latest version'
        'remote-control:Start the remote-control daemon'
        'status:Show session status'
        'feedback:Submit feedback'
    )

    mcp_commands=(
        'add:Add a server'
        'add-json:Add a server from a JSON config string'
        'remove:Remove a server'
        'get:Get details about an MCP server'
        'list:List all configured MCP servers'
        'enable:Enable an MCP server'
        'disable:Disable an MCP server'
        'reset-project-choices:Reset all approved and rejected project-scoped servers'
    )

    plugin_commands=(
        'list:List installed plugins'
        'validate:Validate a plugin from a local directory'
        'install:Install a plugin'
        'i:Install a plugin'
        'uninstall:Uninstall a plugin'
        'remove:Uninstall a plugin'
        'enable:Enable a disabled plugin'
        'disable:Disable an enabled plugin'
        'update:Update a plugin'
        'marketplace:Manage plugin marketplaces'
        'mp:Manage plugin marketplaces'
    )

    plugin_marketplace_commands=(
        'add:Add a marketplace'
        'remove:Remove a marketplace'
        'rm:Remove a marketplace'
        'list:List marketplaces'
        'update:Update marketplaces'
    )

    skill_commands=(
        'list:List discovered agent skills'
        'enable:Enable an agent skill'
        'disable:Disable an agent skill'
        'install:Install an agent skill'
        'link:Link an agent skill from a local path'
        'uninstall:Uninstall an agent skill'
    )

    hook_commands=('migrate:Migrate hooks from Claude Code to Qoder CLI')
    agent_commands=('list:List discovered agents')

    _arguments -C \
        '(- *)'{-h,--help}'[Show help]' \
        '(- *)'{-v,--version}'[Show version]' \
        {-d,--debug}'[Run in debug mode]' \
        {-m,--model}'[Model for the current session]:model:(auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate)' \
        '--reasoning-effort[Set reasoning effort level]:level:' \
        '--context-window[Explicit context window for supported models]:size:' \
        '--list-models[List available models for the current user]' \
        {-i,--prompt-interactive}'[Execute prompt and continue in interactive mode]:text:' \
        {-w,--cwd}'[Change working directory before startup]:directory:_directories' \
        '--config-dir[Use a custom user-level config root]:directory:_directories' \
        '--worktree[Start in a new git worktree]:name:' \
        '--permission-mode[Set the permission mode]:mode:(default accept_edits bypass_permissions dont_ask auto)' \
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
        {-p,--print}'[Print response and exit]' \
        '--no-session-persistence[Disable session persistence]' \
        '--agent[Agent for the current session]:name:' \
        '--agents[JSON object defining custom agents]:json:' \
        '--append-system-prompt[Append to the default system prompt]:text:' \
        '--system-prompt[System prompt for the session]:text:' \
        '--output-style[Output style for this session]:style:' \
        '--mcp-config[Load MCP servers from JSON file(s) or inline JSON]:config:_files' \
        '--strict-mcp-config[Only use MCP servers from --mcp-config]' \
        '--setting-sources[Setting sources to load]:sources:(user project local)' \
        '--settings[Load additional settings from a JSON file path or inline JSON string]:json:_files' \
        '1:command:->command' \
        '*::arg:->args' && return

    case $state in
        command)
            _describe -t commands 'qodercli command' qodercli_commands
            ;;
        args)
            local cmd="" cmd_index=0 next="" third=""
            local idx
            for ((idx = 1; idx <= $#words; idx++)); do
                case ${words[idx]} in
                    mcp|plugins|plugin|skills|skill|hooks|hook|agents|agent|login|commit|rollback|update|remote-control|status|feedback)
                        cmd=${words[idx]}
                        cmd_index=$idx
                        break
                        ;;
                esac
            done
            next=${words[cmd_index+1]}
            third=${words[cmd_index+2]}

            case $cmd in
                mcp)
                    case $next in
                        add)
                            _arguments \
                                {-s,--scope}'[Configuration scope]:scope:(user local project)' \
                                {-t,--transport}'[Transport type]:transport:(stdio sse http ws)' \
                                {-e,--env}'[Set environment variables]:env:' \
                                {-H,--header}'[Set HTTP headers]:header:' \
                                '--headers-helper[External script to generate HTTP headers]:file:_files' \
                                '--client-id[OAuth client ID]:id:' \
                                '--client-secret[Prompt for OAuth client secret]' \
                                '--callback-port[Fixed port for OAuth callback]:port:' \
                                '(- *)'{-h,--help}'[Show help]'
                            ;;
                        add-json)
                            _arguments \
                                {-s,--scope}'[Configuration scope]:scope:(user local project)' \
                                '--client-secret[Prompt for OAuth client secret]' \
                                '(- *)'{-h,--help}'[Show help]'
                            ;;
                        get)
                            _arguments \
                                {-s,--scope}'[Configuration scope]:scope:(user local project)' \
                                '--json[Output as JSON]' \
                                '(- *)'{-h,--help}'[Show help]'
                            ;;
                        remove)
                            _arguments \
                                {-s,--scope}'[Configuration scope]:scope:(user local project)' \
                                '(- *)'{-h,--help}'[Show help]'
                            ;;
                        enable|disable)
                            _arguments '--session[Apply to the current session]' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        list|reset-project-choices)
                            _arguments '(- *)'{-h,--help}'[Show help]'
                            ;;
                        *)
                            _arguments -C \
                                '(- *)'{-h,--help}'[Show help]' \
                                '1:mcp command:->mcp_command' \
                                '*::mcp arg:->mcp_args' && return
                            case $state in
                                mcp_command) _describe -t mcp_commands 'mcp command' mcp_commands ;;
                            esac
                            ;;
                    esac
                    ;;
                plugins|plugin)
                    if [[ $next == marketplace || $next == mp ]]; then
                        case $third in
                            add)
                                _arguments '--sparse[Limit checkout to specific directories]:paths:' '--scope[Marketplace scope]:scope:(user project local)' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            remove|rm)
                                _arguments '--scope[Marketplace scope]:scope:(user project local)' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            list)
                                _arguments '--json[Output as JSON]' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            remove|rm|update)
                                _arguments '(- *)'{-h,--help}'[Show help]'
                                ;;
                            *)
                                _arguments -C \
                                    '(- *)'{-h,--help}'[Show help]' \
                                    '1:marketplace command:->plugin_marketplace_command' \
                                    '*::marketplace arg:->plugin_marketplace_args' && return
                                case $state in
                                    plugin_marketplace_command) _describe -t plugin_marketplace_commands 'marketplace command' plugin_marketplace_commands ;;
                                esac
                                ;;
                        esac
                    else
                        case $next in
                            list)
                                _arguments '--json[Output as JSON]' '--available[Include available plugins]' {-o,--output-format}'[Output format]:format:(text json)' '--plugin-dir[Additional plugin directories]:directory:_directories' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            validate)
                                _arguments '1:path:_directories' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            install|i)
                                _arguments {-s,--scope}'[Installation scope]:scope:(user project local)' '--json[Output as JSON]' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            uninstall|remove)
                                _arguments {-s,--scope}'[Installation scope]:scope:(user project local)' '--keep-data[Preserve plugin data]' '--json[Output as JSON]' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            enable|update)
                                _arguments {-s,--scope}'[Installation scope]:scope:(user project local)' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            disable)
                                _arguments {-a,--all}'[Disable all enabled plugins]' {-s,--scope}'[Installation scope]:scope:(user project local)' '(- *)'{-h,--help}'[Show help]'
                                ;;
                            *)
                                _arguments -C \
                                    '(- *)'{-h,--help}'[Show help]' \
                                    '1:plugin command:->plugin_command' \
                                    '*::plugin arg:->plugin_args' && return
                                case $state in
                                    plugin_command) _describe -t plugin_commands 'plugin command' plugin_commands ;;
                                esac
                                ;;
                        esac
                    fi
                    ;;
                skills|skill)
                    case $next in
                        list)
                            _arguments '--all[Show all skills]' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        disable)
                            _arguments {-s,--scope}'[Scope to disable the skill in]:scope:(user workspace)' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        install)
                            _arguments '--scope[Installation scope]:scope:(user workspace)' '--path[Sub-path within repository]:path:' '--consent[Acknowledge security risks]' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        link)
                            _arguments '1:path:_directories' '--scope[Link scope]:scope:(user workspace)' '--consent[Acknowledge security risks]' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        uninstall)
                            _arguments '--scope[Uninstall scope]:scope:(user workspace)' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        enable)
                            _arguments '(- *)'{-h,--help}'[Show help]'
                            ;;
                        *)
                            _arguments -C '(- *)'{-h,--help}'[Show help]' '1:skill command:->skill_command' '*::skill arg:->skill_args' && return
                            case $state in
                                skill_command) _describe -t skill_commands 'skill command' skill_commands ;;
                            esac
                            ;;
                    esac
                    ;;
                hooks|hook)
                    case $next in
                        migrate)
                            _arguments '--from-claude[Migrate from Claude Code hooks]' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        *)
                            _arguments -C '(- *)'{-h,--help}'[Show help]' '1:hook command:->hook_command' '*::hook arg:->hook_args' && return
                            case $state in
                                hook_command) _describe -t hook_commands 'hook command' hook_commands ;;
                            esac
                            ;;
                    esac
                    ;;
                agents|agent)
                    case $next in
                        list)
                            _arguments '--setting-sources[Setting sources]:sources:(user project local)' '(- *)'{-h,--help}'[Show help]'
                            ;;
                        *)
                            _arguments -C '--setting-sources[Setting sources]:sources:(user project local)' '(- *)'{-h,--help}'[Show help]' '1:agent command:->agent_command' '*::agent arg:->agent_args' && return
                            case $state in
                                agent_command) _describe -t agent_commands 'agent command' agent_commands ;;
                            esac
                            ;;
                    esac
                    ;;
                remote-control)
                    _arguments '--name[Environment display name]:name:' '--spawn[Session scheduling mode]:mode:(same-dir worktree)' '--capacity[Maximum concurrent sessions]:count:' '--directory[Directory to use as cwd]:directory:_directories' '--verbose[Stream child worker output]' '(- *)'{-h,--help}'[Show help]'
                    ;;
                status)
                    _arguments {-o,--output}'[Output format]:format:(text json)' '(- *)'{-h,--help}'[Show help]'
                    ;;
                feedback)
                    _arguments {-c,--content}'[Feedback description]:content:' {-s,--session-id}'[Session id]:id:' '--workdir[Working directory]:directory:_directories' '--email[Contact email]:email:' '--images[Screenshot file paths]:file:_files' '--caller-version[External application version]:version:' '--ide-type[IDE type]:type:' '--json[Emit JSON]' '(- *)'{-h,--help}'[Show help]'
                    ;;
                rollback)
                    _arguments '--to[Target version]:version:' '(- *)'{-h,--help}'[Show help]'
                    ;;
                update)
                    _arguments '--check[Only check if an update is available]' '(- *)'{-h,--help}'[Show help]'
                    ;;
                commit)
                    _arguments {-m,--message}'[Commit message]:message:' {-w,--workspace}'[Working directory]:directory:_directories' '--hook[Hook mode]' '(- *)'{-h,--help}'[Show help]'
                    ;;
                login)
                    _arguments '(- *)'{-h,--help}'[Show help]'
                    ;;
            esac
            ;;
    esac
}

_qodercli "$@"
