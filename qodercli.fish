# fish completion for qodercli
# Generated manually based on qodercli --help

complete -c qodercli -f

function __qodercli_no_subcommand
    set -l cmd (commandline -opc)
    for word in $cmd[2..]
        if contains -- $word mcp plugins plugin skills skill hooks hook agents agent login commit rollback update remote-control status feedback
            return 1
        end
    end
    return 0
end

function __qodercli_using_top_command
    set -l cmd (commandline -opc)
    for word in $cmd[2..]
        if contains -- $word mcp plugins plugin skills skill hooks hook agents agent login commit rollback update remote-control status feedback
            contains -- $word $argv
            return $status
        end
    end
    return 1
end

function __qodercli_group_no_child
    set -l groups (string split , $argv[1])
    set -l children (string split , $argv[2])
    set -l cmd (commandline -opc)
    set -l found_group 0

    for word in $cmd[2..]
        if test $found_group -eq 0
            if contains -- $word $groups
                set found_group 1
            end
        else if contains -- $word $children
            return 1
        end
    end

    test $found_group -eq 1
end

function __qodercli_using_group_child
    set -l groups (string split , $argv[1])
    set -l children (string split , $argv[2])
    set -l cmd (commandline -opc)
    set -l found_group 0

    for word in $cmd[2..]
        if test $found_group -eq 0
            if contains -- $word $groups
                set found_group 1
            end
        else if contains -- $word $children
            return 0
        end
    end

    return 1
end

function __qodercli_plugin_marketplace_no_child
    set -l cmd (commandline -opc)
    set -l found_plugin 0
    set -l found_marketplace 0

    for word in $cmd[2..]
        if test $found_plugin -eq 0
            if contains -- $word plugins plugin
                set found_plugin 1
            end
        else if test $found_marketplace -eq 0
            if contains -- $word marketplace mp
                set found_marketplace 1
            end
        else if contains -- $word add remove rm list update
            return 1
        end
    end

    test $found_marketplace -eq 1
end

function __qodercli_using_plugin_marketplace_child
    set -l cmd (commandline -opc)
    set -l found_plugin 0
    set -l found_marketplace 0

    for word in $cmd[2..]
        if test $found_plugin -eq 0
            if contains -- $word plugins plugin
                set found_plugin 1
            end
        else if test $found_marketplace -eq 0
            if contains -- $word marketplace mp
                set found_marketplace 1
            end
        else if contains -- $word $argv
            return 0
        end
    end

    return 1
end

# Top-level subcommands
complete -c qodercli -n __qodercli_no_subcommand -a mcp -d 'Configure and manage MCP servers'
complete -c qodercli -n __qodercli_no_subcommand -a plugins -d 'Manage plugins'
complete -c qodercli -n __qodercli_no_subcommand -a plugin -d 'Manage plugins'
complete -c qodercli -n __qodercli_no_subcommand -a skills -d 'Manage agent skills'
complete -c qodercli -n __qodercli_no_subcommand -a skill -d 'Manage agent skills'
complete -c qodercli -n __qodercli_no_subcommand -a hooks -d 'Manage hooks'
complete -c qodercli -n __qodercli_no_subcommand -a hook -d 'Manage hooks'
complete -c qodercli -n __qodercli_no_subcommand -a agents -d 'Manage subagents'
complete -c qodercli -n __qodercli_no_subcommand -a agent -d 'Manage subagents'
complete -c qodercli -n __qodercli_no_subcommand -a login -d 'Sign in to your account'
complete -c qodercli -n __qodercli_no_subcommand -a commit -d 'Generate a commit message and commit changes'
complete -c qodercli -n __qodercli_no_subcommand -a rollback -d 'Rollback to a previous version'
complete -c qodercli -n __qodercli_no_subcommand -a update -d 'Update to the latest version'
complete -c qodercli -n __qodercli_no_subcommand -a remote-control -d 'Start the remote-control daemon'
complete -c qodercli -n __qodercli_no_subcommand -a status -d 'Show session status'
complete -c qodercli -n __qodercli_no_subcommand -a feedback -d 'Submit feedback'

# Top-level flags
complete -c qodercli -n __qodercli_no_subcommand -s h -l help -d 'Show help'
complete -c qodercli -n __qodercli_no_subcommand -s v -l version -d 'Show version'
complete -c qodercli -n __qodercli_no_subcommand -s d -l debug -d 'Run in debug mode'
complete -c qodercli -n __qodercli_no_subcommand -s m -l model -r -a 'auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate' -d 'Model for the current session'
complete -c qodercli -n __qodercli_no_subcommand -l reasoning-effort -r -d 'Set reasoning effort level'
complete -c qodercli -n __qodercli_no_subcommand -l context-window -r -d 'Explicit context window for supported models'
complete -c qodercli -n __qodercli_no_subcommand -l list-models -d 'List available models'
complete -c qodercli -n __qodercli_no_subcommand -s i -l prompt-interactive -r -d 'Execute prompt and continue in interactive mode'
complete -c qodercli -n __qodercli_no_subcommand -s w -l cwd -r -F -d 'Change working directory'
complete -c qodercli -n __qodercli_no_subcommand -l config-dir -r -F -d 'Use a custom user-level config root'
complete -c qodercli -n __qodercli_no_subcommand -l worktree -r -d 'Start in a new git worktree'
complete -c qodercli -n __qodercli_no_subcommand -l permission-mode -r -a 'default accept_edits bypass_permissions dont_ask auto' -d 'Set the permission mode'
complete -c qodercli -n __qodercli_no_subcommand -l dangerously-skip-permissions -d 'Bypass all permission checks'
complete -c qodercli -n __qodercli_no_subcommand -l allowed-mcp-server-names -r -d 'Allowed MCP server names'
complete -c qodercli -n __qodercli_no_subcommand -l tools -r -d 'Restrict available built-in tools'
complete -c qodercli -n __qodercli_no_subcommand -l allowed-tools -r -d 'Tools to allow'
complete -c qodercli -n __qodercli_no_subcommand -l disallowed-tools -r -d 'Tools to deny'
complete -c qodercli -n __qodercli_no_subcommand -l attachment -r -F -d 'Attach files to the initial prompt'
complete -c qodercli -n __qodercli_no_subcommand -l plugin-dir -r -F -d 'Plugin directories to load'
complete -c qodercli -n __qodercli_no_subcommand -s c -l continue -d 'Continue the most recent session'
complete -c qodercli -n __qodercli_no_subcommand -l fork-session -d 'Create a new session from a resumed conversation'
complete -c qodercli -n __qodercli_no_subcommand -s r -l resume -r -d 'Resume a previous session'
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
complete -c qodercli -n __qodercli_no_subcommand -s p -l print -d 'Print response and exit'
complete -c qodercli -n __qodercli_no_subcommand -l no-session-persistence -d 'Disable session persistence'
complete -c qodercli -n __qodercli_no_subcommand -l agent -r -d 'Agent for the current session'
complete -c qodercli -n __qodercli_no_subcommand -l agents -r -d 'JSON object defining custom agents'
complete -c qodercli -n __qodercli_no_subcommand -l append-system-prompt -r -d 'Append to the default system prompt'
complete -c qodercli -n __qodercli_no_subcommand -l system-prompt -r -d 'System prompt for the session'
complete -c qodercli -n __qodercli_no_subcommand -l output-style -r -d 'Output style for this session'
complete -c qodercli -n __qodercli_no_subcommand -l mcp-config -r -F -d 'Load MCP servers from JSON file(s) or inline JSON'
complete -c qodercli -n __qodercli_no_subcommand -l strict-mcp-config -d 'Only use MCP servers from --mcp-config'
complete -c qodercli -n __qodercli_no_subcommand -l setting-sources -r -a 'user project local' -d 'Setting sources to load'
complete -c qodercli -n __qodercli_no_subcommand -l settings -r -F -d 'Load additional settings from JSON'

# mcp
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a add -d 'Add a server'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a add-json -d 'Add a server from a JSON config string'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a remove -d 'Remove a server'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a get -d 'Get details about an MCP server'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a list -d 'List all configured MCP servers'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a enable -d 'Enable an MCP server'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a disable -d 'Disable an MCP server'
complete -c qodercli -n '__qodercli_group_no_child mcp add,add-json,remove,get,list,enable,disable,reset-project-choices' -a reset-project-choices -d 'Reset project-scoped server choices'
complete -c qodercli -n '__qodercli_using_top_command mcp' -s h -l help -d 'Show help'

complete -c qodercli -n '__qodercli_using_group_child mcp add' -s s -l scope -r -a 'user local project' -d 'Configuration scope'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -s t -l transport -r -a 'stdio sse http ws' -d 'Transport type'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -s e -l env -r -d 'Set environment variables'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -s H -l header -r -d 'Set HTTP headers'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -l headers-helper -r -F -d 'External script to generate HTTP headers'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -l client-id -r -d 'OAuth client ID'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -l client-secret -d 'Prompt for OAuth client secret'
complete -c qodercli -n '__qodercli_using_group_child mcp add' -l callback-port -r -d 'Fixed port for OAuth callback'

complete -c qodercli -n '__qodercli_using_group_child mcp add-json' -s s -l scope -r -a 'user local project' -d 'Configuration scope'
complete -c qodercli -n '__qodercli_using_group_child mcp add-json' -l client-secret -d 'Prompt for OAuth client secret'
complete -c qodercli -n '__qodercli_using_group_child mcp remove,get' -s s -l scope -r -a 'user local project' -d 'Configuration scope'
complete -c qodercli -n '__qodercli_using_group_child mcp get' -l json -d 'Output as JSON'
complete -c qodercli -n '__qodercli_using_group_child mcp enable,disable' -l session -d 'Apply to the current session'

for cmd in add add-json remove get list enable disable reset-project-choices
    complete -c qodercli -n "__qodercli_using_group_child mcp $cmd" -s h -l help -d 'Show help'
end

# plugins
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a list -d 'List installed plugins'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a validate -d 'Validate a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a install -d 'Install a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a i -d 'Install a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a uninstall -d 'Uninstall a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a remove -d 'Uninstall a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a enable -d 'Enable a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a disable -d 'Disable a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a update -d 'Update a plugin'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a marketplace -d 'Manage plugin marketplaces'
complete -c qodercli -n '__qodercli_group_no_child plugins,plugin list,validate,install,i,uninstall,remove,enable,disable,update,marketplace,mp' -a mp -d 'Manage plugin marketplaces'
complete -c qodercli -n '__qodercli_using_top_command plugins plugin' -s h -l help -d 'Show help'

complete -c qodercli -n '__qodercli_using_group_child plugins,plugin list' -l json -d 'Output as JSON'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin list' -l available -d 'Include available plugins'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin list' -s o -l output-format -r -a 'text json' -d 'Output format'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin list' -l plugin-dir -r -F -d 'Additional plugin directories'

complete -c qodercli -n '__qodercli_using_group_child plugins,plugin install,i,uninstall,remove,enable,disable,update' -s s -l scope -r -a 'user project local' -d 'Scope'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin install,i,uninstall,remove' -l json -d 'Output as JSON'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin uninstall,remove' -l keep-data -d 'Preserve plugin data'
complete -c qodercli -n '__qodercli_using_group_child plugins,plugin disable' -s a -l all -d 'Disable all enabled plugins'

complete -c qodercli -n __qodercli_plugin_marketplace_no_child -a add -d 'Add a marketplace'
complete -c qodercli -n __qodercli_plugin_marketplace_no_child -a remove -d 'Remove a marketplace'
complete -c qodercli -n __qodercli_plugin_marketplace_no_child -a rm -d 'Remove a marketplace'
complete -c qodercli -n __qodercli_plugin_marketplace_no_child -a list -d 'List marketplaces'
complete -c qodercli -n __qodercli_plugin_marketplace_no_child -a update -d 'Update marketplaces'
complete -c qodercli -n '__qodercli_using_plugin_marketplace_child add' -l sparse -r -d 'Limit checkout to specific directories'
complete -c qodercli -n '__qodercli_using_plugin_marketplace_child add' -l scope -r -a 'user project local' -d 'Marketplace scope'
complete -c qodercli -n '__qodercli_using_plugin_marketplace_child remove rm' -l scope -r -a 'user project local' -d 'Marketplace scope'
complete -c qodercli -n '__qodercli_using_plugin_marketplace_child list' -l json -d 'Output as JSON'

for cmd in list validate install i uninstall remove enable disable update marketplace mp
    complete -c qodercli -n "__qodercli_using_group_child plugins,plugin $cmd" -s h -l help -d 'Show help'
end
for cmd in add remove rm list update
    complete -c qodercli -n "__qodercli_using_plugin_marketplace_child $cmd" -s h -l help -d 'Show help'
end

# skills
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a list -d 'List discovered agent skills'
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a enable -d 'Enable an agent skill'
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a disable -d 'Disable an agent skill'
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a install -d 'Install an agent skill'
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a link -d 'Link an agent skill'
complete -c qodercli -n '__qodercli_group_no_child skills,skill list,enable,disable,install,link,uninstall' -a uninstall -d 'Uninstall an agent skill'
complete -c qodercli -n '__qodercli_using_top_command skills skill' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_group_child skills,skill list' -l all -d 'Show all skills'
complete -c qodercli -n '__qodercli_using_group_child skills,skill disable' -s s -l scope -r -a 'user workspace' -d 'Scope'
complete -c qodercli -n '__qodercli_using_group_child skills,skill install,link,uninstall' -l scope -r -a 'user workspace' -d 'Scope'
complete -c qodercli -n '__qodercli_using_group_child skills,skill install' -l path -r -d 'Sub-path within repository'
complete -c qodercli -n '__qodercli_using_group_child skills,skill install,link' -l consent -d 'Acknowledge security risks'
for cmd in list enable disable install link uninstall
    complete -c qodercli -n "__qodercli_using_group_child skills,skill $cmd" -s h -l help -d 'Show help'
end

# hooks, agents
complete -c qodercli -n '__qodercli_group_no_child hooks,hook migrate' -a migrate -d 'Migrate hooks from Claude Code to Qoder CLI'
complete -c qodercli -n '__qodercli_using_group_child hooks,hook migrate' -l from-claude -d 'Migrate from Claude Code hooks'
complete -c qodercli -n '__qodercli_using_top_command hooks hook' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_group_child hooks,hook migrate' -s h -l help -d 'Show help'

complete -c qodercli -n '__qodercli_group_no_child agents,agent list' -a list -d 'List discovered agents'
complete -c qodercli -n '__qodercli_using_top_command agents agent' -l setting-sources -r -a 'user project local' -d 'Setting sources'
complete -c qodercli -n '__qodercli_using_top_command agents agent' -s h -l help -d 'Show help'
complete -c qodercli -n '__qodercli_using_group_child agents,agent list' -s h -l help -d 'Show help'

# Other top-level commands
complete -c qodercli -n '__qodercli_using_top_command remote-control' -l name -r -d 'Environment display name'
complete -c qodercli -n '__qodercli_using_top_command remote-control' -l spawn -r -a 'same-dir worktree' -d 'Session scheduling mode'
complete -c qodercli -n '__qodercli_using_top_command remote-control' -l capacity -r -d 'Maximum concurrent sessions'
complete -c qodercli -n '__qodercli_using_top_command remote-control' -l directory -r -F -d 'Directory to use as cwd'
complete -c qodercli -n '__qodercli_using_top_command remote-control' -l verbose -d 'Stream child worker output'

complete -c qodercli -n '__qodercli_using_top_command status' -s o -l output -r -a 'text json' -d 'Output format'
complete -c qodercli -n '__qodercli_using_top_command feedback' -s c -l content -r -d 'Feedback description'
complete -c qodercli -n '__qodercli_using_top_command feedback' -s s -l session-id -r -d 'Session id'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l workdir -r -F -d 'Working directory'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l email -r -d 'Contact email'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l images -r -F -d 'Screenshot file paths'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l caller-version -r -d 'External application version'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l ide-type -r -d 'IDE type'
complete -c qodercli -n '__qodercli_using_top_command feedback' -l json -d 'Emit JSON'
complete -c qodercli -n '__qodercli_using_top_command rollback' -l to -r -d 'Target version'
complete -c qodercli -n '__qodercli_using_top_command update' -l check -d 'Only check for an update'
complete -c qodercli -n '__qodercli_using_top_command commit' -s m -l message -r -d 'Commit message'
complete -c qodercli -n '__qodercli_using_top_command commit' -s w -l workspace -r -F -d 'Working directory'
complete -c qodercli -n '__qodercli_using_top_command commit' -l hook -d 'Hook mode'

for cmd in login commit rollback update remote-control status feedback
    complete -c qodercli -n "__qodercli_using_top_command $cmd" -s h -l help -d 'Show help'
end
