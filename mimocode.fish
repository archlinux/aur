# Fish completion for mimo (MiMo Code)

complete -c mimo -f

# Global options
complete -c mimo -s h -l help -d "Show help"
complete -c mimo -s v -l version -d "Show version"
complete -c mimo -s m -l model -d "Model to use (provider/model)"
complete -c mimo -s c -l continue -d "Continue last session"
complete -c mimo -s s -l session -d "Session ID to continue"
complete -c mimo -l agent -d "Agent to use"
complete -c mimo -l never-ask -d "Auto-decide without asking"
complete -c mimo -l trust -d "Skip workspace trust prompt"
complete -c mimo -l port -d "Port to listen on"
complete -c mimo -l hostname -d "Hostname to listen on"
complete -c mimo -l mdns -d "Enable mDNS service discovery"
complete -c mimo -l no-auth -d "Allow without authentication"

# Subcommands
complete -c mimo -n __fish_use_subcommand -a completion -d "Generate shell completion"
complete -c mimo -n __fish_use_subcommand -a acp -d "Start ACP server"
complete -c mimo -n __fish_use_subcommand -a mcp -d "Manage MCP servers"
complete -c mimo -n __fish_use_subcommand -a run -d "Run with a message"
complete -c mimo -n __fish_use_subcommand -a debug -d "Debugging tools"
complete -c mimo -n __fish_use_subcommand -a providers -d "Manage providers"
complete -c mimo -n __fish_use_subcommand -a agent -d "Manage agents"
complete -c mimo -n __fish_use_subcommand -a upgrade -d "Upgrade mimocode"
complete -c mimo -n __fish_use_subcommand -a uninstall -d "Uninstall mimocode"
complete -c mimo -n __fish_use_subcommand -a serve -d "Start headless server"
complete -c mimo -n __fish_use_subcommand -a models -d "List available models"
complete -c mimo -n __fish_use_subcommand -a stats -d "Token usage statistics"
complete -c mimo -n __fish_use_subcommand -a export -d "Export session data"
complete -c mimo -n __fish_use_subcommand -a import -d "Import session data"
complete -c mimo -n __fish_use_subcommand -a github -d "Manage GitHub agent"
complete -c mimo -n __fish_use_subcommand -a pr -d "Fetch and checkout PR"
complete -c mimo -n __fish_use_subcommand -a session -d "Manage sessions"
complete -c mimo -n __fish_use_subcommand -a plugin -d "Install plugin"
complete -c mimo -n __fish_use_subcommand -a db -d "Database tools"

# providers subcommands
complete -c mimo -n '__fish_seen_subcommand_from providers' -a login -d "Log in"
complete -c mimo -n '__fish_seen_subcommand_from providers' -a logout -d "Log out"
complete -c mimo -n '__fish_seen_subcommand_from providers' -a list -d "List providers"
complete -c mimo -n '__fish_seen_subcommand_from providers' -a whoami -d "Show current user"

# agent subcommands
complete -c mimo -n '__fish_seen_subcommand_from agent' -a create -d "Create agent"
complete -c mimo -n '__fish_seen_subcommand_from agent' -a list -d "List agents"

# session subcommands
complete -c mimo -n '__fish_seen_subcommand_from session' -a list -d "List sessions"

# mcp subcommands
complete -c mimo -n '__fish_seen_subcommand_from mcp' -a list -d "List MCP servers"
