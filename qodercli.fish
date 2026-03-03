# Fish completion for qodercli
# Generated for qodercli AUR package

# Disable file completion by default
complete -c qodercli -f

# Global flags
complete -c qodercli -l agents -d 'JSON object defining custom agents' -r
complete -c qodercli -l allowed-tools -d 'Comma or space-separated list of allowed tool names' -r
complete -c qodercli -l attachment -d 'Attachment path' -r -F
complete -c qodercli -l branch -d 'Branch name' -r
complete -c qodercli -s c -l continue -d 'Continue the most recent conversation'
complete -c qodercli -l dangerously-skip-permissions -d 'Bypass all permission checks'
complete -c qodercli -l disallowed-tools -d 'Comma or space-separated list of disallowed tool names' -r
complete -c qodercli -s h -l help -d 'help for qodercli'
complete -c qodercli -l input-format -d 'Input format for non-interactive mode' -r -a "text stream-json"
complete -c qodercli -l max-output-tokens -d 'Max tokens for model output response' -r -a "16k 32k"
complete -c qodercli -l max-turns -d 'Maximum agent loop cycles' -r
complete -c qodercli -l model -d 'Specify the model level to use for the session' -r -a "auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate"
complete -c qodercli -s f -l output-format -d 'Output format for non-interactive mode' -r -a "text json stream-json"
complete -c qodercli -l path -d 'Worktree path of the worktree job' -r -F
complete -c qodercli -s p -l print -d 'Print response and exit' -r
complete -c qodercli -s q -l quiet -d 'Hide spinner in non-interactive mode'
complete -c qodercli -s r -l resume -d 'Resume a conversation' -r
complete -c qodercli -s v -l version -d 'Version'
complete -c qodercli -l with-claude-config -d 'Load claude code configurations'
complete -c qodercli -s w -l workspace -d 'Current working directory' -r -F
complete -c qodercli -l worktree -d 'Start a concurrent job via git worktree'
complete -c qodercli -l yolo -d 'Bypass all permission checks'

# Subcommands
complete -c qodercli -n __fish_use_subcommand -a jobs -d 'List concurrent job(s) for current workspace'
complete -c qodercli -n __fish_use_subcommand -a rm -d 'Remove concurrent job(s) for current workspace'
complete -c qodercli -n __fish_use_subcommand -a feedback -d 'Submit feedback with optional images'
complete -c qodercli -n __fish_use_subcommand -a help -d 'Help about any command'
complete -c qodercli -n __fish_use_subcommand -a mcp -d 'Manage MCP (Model Context Protocol) servers'
complete -c qodercli -n __fish_use_subcommand -a status -d 'Show account and CLI status'
complete -c qodercli -n __fish_use_subcommand -a update -d 'Check remote version and self-update to the latest release'

# jobs subcommand
complete -c qodercli -n '__fish_seen_subcommand_from jobs' -s a -l all -d 'Show all concurrent jobs'
complete -c qodercli -n '__fish_seen_subcommand_from jobs' -s h -l help -d 'help for jobs'
complete -c qodercli -n '__fish_seen_subcommand_from jobs' -s w -l workspace -d 'Current working directory' -r -F

# rm subcommand
complete -c qodercli -n '__fish_seen_subcommand_from rm' -s h -l help -d 'help for rm'
complete -c qodercli -n '__fish_seen_subcommand_from rm' -l kubeconfig -d 'Kubeconfig of the kubernetes job' -r -F
complete -c qodercli -n '__fish_seen_subcommand_from rm' -l namespace -d 'Namespace of the kubernetes job' -r
complete -c qodercli -n '__fish_seen_subcommand_from rm' -s w -l workspace -d 'Current working directory' -r -F

# feedback subcommand
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -s c -l content -d 'Feedback content' -r
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -s h -l help -d 'help for feedback'
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -s i -l images -d 'Image file paths' -r -F
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -s s -l session -d 'Session ID' -r
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -l workdir -d 'Working directory' -r -F
complete -c qodercli -n '__fish_seen_subcommand_from feedback' -s w -l workspace -d 'Current working directory' -r -F

# mcp subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -s h -l help -d 'help for mcp'
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -s w -l workspace -d 'Current working directory' -r -F

# mcp subcommands
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -a add -d 'Add a new MCP server'
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -a auth -d 'Authenticate with an MCP server using OAuth'
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -a get -d 'Get details of an MCP server'
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -a list -d 'List all MCP servers'
complete -c qodercli -n '__fish_seen_subcommand_from mcp' -a remove -d 'Remove an MCP Server'

# mcp add subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s e -l env -d 'Set environment variables' -r
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s H -l header -d 'Set HTTP headers for SSE and HTTP transports' -r
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s h -l help -d 'help for add'
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s s -l scope -d 'Configuration scope' -r -a "local user project"
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s t -l transport -d 'Transport type' -r -a "stdio sse http"
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from add' -s w -l workspace -d 'Current working directory' -r -F

# mcp auth subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from auth' -s h -l help -d 'help for auth'
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from auth' -s w -l workspace -d 'Current working directory' -r -F

# mcp get subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from get' -s h -l help -d 'help for get'
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from get' -s w -l workspace -d 'Current working directory' -r -F

# mcp list subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from list' -s h -l help -d 'help for list'
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from list' -s w -l workspace -d 'Current working directory' -r -F

# mcp remove subcommand
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from remove' -s h -l help -d 'help for remove'
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from remove' -s s -l scope -d 'Configuration scope' -r -a "local user project"
complete -c qodercli -n '__fish_seen_subcommand_from mcp; and __fish_seen_subcommand_from remove' -s w -l workspace -d 'Current working directory' -r -F

# status subcommand
complete -c qodercli -n '__fish_seen_subcommand_from status' -s h -l help -d 'help for status'
complete -c qodercli -n '__fish_seen_subcommand_from status' -s o -l output -d 'Output format' -r -a "text json"
complete -c qodercli -n '__fish_seen_subcommand_from status' -s w -l workspace -d 'Current working directory' -r -F

# help subcommand - show available commands
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'jobs' -d 'List concurrent job(s)'
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'rm' -d 'Remove concurrent job(s)'
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'feedback' -d 'Submit feedback'
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'mcp' -d 'Manage MCP servers'
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'status' -d 'Show account and CLI status'
complete -c qodercli -n '__fish_seen_subcommand_from help' -a 'update' -d 'Self-update to latest release'
