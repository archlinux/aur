#compdef qodercli
# zsh completion for qodercli
# Generated manually based on qodercli --help

_qodercli() {
    local -a commands mcp_commands

    commands=(
        'commit:Commit AI-generated code and record AI contribution statistics'
        'jobs:List concurrent job(s)'
        'rm:Remove concurrent job(s)'
        'feedback:Submit feedback with optional images'
        'help:Help about any command'
        'install:Install qodercli to the standard location'
        'mcp:Manage MCP (Model Context Protocol) servers'
        'status:Show account and CLI status'
        'update:Check remote version and self-update to the latest release'
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
        {-c,--continue}'[Continue the most recent conversation]' \
        {-p,--print}'[Print response and exit]:prompt:' \
        {-q,--quiet}'[Hide spinner in non-interactive mode]' \
        {-r,--resume}'[Resume a conversation by session ID]:session_id:' \
        {-f,--output-format}'[Output format for non-interactive mode]:format:(text json stream-json)' \
        {-w,--workspace}'[Current working directory]:directory:_directories' \
        '--agents[JSON object defining custom agents]:json:' \
        '*--allowed-tools[Allowed tool names]:tools:' \
        '*--attachment[Attachment path]:file:_files' \
        '--branch[Branch name (only works with --worktree)]:branch:' \
        '--dangerously-skip-permissions[Bypass all permission checks]' \
        '*--disallowed-tools[Disallowed tool names]:tools:' \
        '--experimental-mcp-load[Enable dynamic discovery and loading of tools from MCP servers]' \
        '*--summarize-tool[Tool patterns to auto-summarize outputs]:tools:' \
        '--input-format[Input format for non-interactive mode]:format:(text stream-json)' \
        '--max-output-tokens[Max tokens for model output]:tokens:(16k 32k)' \
        '--max-turns[Maximum agent loop cycles]:turns:' \
        '--model[Model level for the session]:model:(auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate)' \
        '--path[Worktree path (only works with --worktree)]:path:_directories' \
        '--with-claude-config[Load claude code configurations]' \
        '--worktree[Start a concurrent job via git worktree]' \
        '--yolo[Bypass all permission checks]' \
        '1:command:->command' \
        '*::arg:->args' && return

    case $state in
        command)
            _describe -t commands 'qodercli command' commands
            ;;
        args)
            case ${words[1]} in
                jobs)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        {-a,--all}'[Show all concurrent jobs]' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories'
                    ;;
                rm)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        {-f,--force}'[Force remove a running job by terminating its process]' \
                        '--kubeconfig[Kubeconfig of the kubernetes job]:file:_files' \
                        '--namespace[Namespace of the kubernetes job]:namespace:' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                        '1:job_id:'
                    ;;
                feedback)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        '--caller-version[Caller application version]:version:' \
                        {-c,--content}'[Feedback content]:content:' \
                        '--email[Contact email address]:email:' \
                        '*'{-i,--images}'[Image file paths]:file:_files' \
                        '--json[Output result in JSON format]' \
                        {-s,--session}'[Session ID]:session_id:' \
                        '--workdir[Working directory]:directory:_directories' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories'
                    ;;
                commit)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        {-m,--message}'[Commit message]:message:' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Working directory]:directory:_directories'
                    ;;
                help)
                    _describe -t commands 'qodercli command' commands
                    ;;
                status)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        {-o,--output}'[Output format]:format:(text json)' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories'
                    ;;
                update)
                    ;;
                install)
                    _arguments \
                        '(- *)'{-h,--help}'[Show help]' \
                        '--force[Overwrite existing installation of the same version]' \
                        '--quiet[Suppress progress output]' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories'
                    ;;
                mcp)
                    _arguments -C \
                        '(- *)'{-h,--help}'[Show help]' \
                        {-v,--version}'[Show version]' \
                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                        '1:mcp command:->mcp_command' \
                        '*::mcp arg:->mcp_args' && return

                    case $state in
                        mcp_command)
                            _describe -t mcp_commands 'mcp command' mcp_commands
                            ;;
                        mcp_args)
                            case ${words[1]} in
                                add)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        '*'{-e,--env}'[Set environment variables]:env:' \
                                        '*'{-H,--header}'[Set HTTP headers]:header:' \
                                        {-s,--scope}'[Configuration scope]:scope:(local user project)' \
                                        {-t,--transport}'[Transport type]:transport:(stdio sse http streamable-http)' \
                                        {-v,--version}'[Show version]' \
                                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                                        '1:name:' \
                                        '2:endpoint:'
                                    ;;
                                auth)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        {-v,--version}'[Show version]' \
                                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                                        '1:server_name:'
                                    ;;
                                get)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        {-v,--version}'[Show version]' \
                                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                                        '1:name:'
                                    ;;
                                list)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        {-v,--version}'[Show version]' \
                                        {-w,--workspace}'[Current working directory]:directory:_directories'
                                    ;;
                                remove)
                                    _arguments \
                                        '(- *)'{-h,--help}'[Show help]' \
                                        {-s,--scope}'[Configuration scope]:scope:(local user project)' \
                                        {-v,--version}'[Show version]' \
                                        {-w,--workspace}'[Current working directory]:directory:_directories' \
                                        '1:name:'
                                    ;;
                            esac
                            ;;
                    esac
                    ;;
            esac
            ;;
    esac
}

_qodercli "$@"
