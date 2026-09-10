###-begin-notes-completions-###
#
# Static completion script for Fish
#
# Installation:
#   notes --completions fish > ~/.config/fish/completions/notes.fish
#

complete -c notes -n '__fish_use_subcommand' -f
complete -c notes -n '__fish_use_subcommand' -f -a 'root' -d 'Print the notes vault root'
complete -c notes -n '__fish_use_subcommand' -f -a 'context' -d 'Resolve project-note context for integration plugins.'
complete -c notes -n '__fish_use_subcommand' -f -a 'list' -d 'List repository notes'
complete -c notes -n '__fish_use_subcommand' -f -a 'search' -d 'Search repository note metadata'
complete -c notes -n '__fish_use_subcommand' -f -a 'read' -d 'Print a note file'
complete -c notes -n '__fish_use_subcommand' -f -a 'write' -d 'Write stdin to a note file, then commit and push it'
complete -c notes -n '__fish_use_subcommand' -f -a 'delete' -d 'Delete a note file, then commit and push it'
complete -c notes -n '__fish_use_subcommand' -f -a 'move' -d 'Move a note to another known repository scope'
complete -c notes -n '__fish_use_subcommand' -f -a 'create' -d 'Create a note from stdin, then commit and push it'
complete -c notes -n '__fish_use_subcommand' -f -a 'targets' -d 'List known repository targets'
complete -c notes -n '__fish_use_subcommand' -f -a 'agents' -d 'List installed agent targets'
complete -c notes -n '__fish_use_subcommand' -f -a 'priority' -d 'Set a note priority, then commit and push it'
complete -c notes -n '__fish_use_subcommand' -f -a 'open-agent' -d 'Open a note in an installed agent through Herdr'
complete -c notes -n '__fish_use_subcommand' -f -a 'handoffs' -d 'Browse handoff-tagged notes'
complete -c notes -n '__fish_use_subcommand' -f -a 'mcp' -d 'Run the notes MCP server over stdio'
complete -c notes -n '__fish_use_subcommand' -f -a 'capture' -d 'Process a captured note through local OpenCode'
complete -c notes -n '__fish_use_subcommand' -f -a 'daemon' -d 'Process captured notes through local OpenCode'
complete -c notes -n '__fish_use_subcommand; and not __fish_contains_opt all no-all' -l all -d 'Browse notes from every projects directory'
complete -c notes -n '__fish_use_subcommand; and not __fish_contains_opt all no-all' -l no-all -d 'Disable all'
complete -c notes -n '__fish_use_subcommand; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--all' -d 'Browse notes from every projects directory'
complete -c notes -n '__fish_use_subcommand; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--no-all' -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from root' -f
complete -c notes -n '__fish_seen_subcommand_from root; and not __fish_contains_opt projects no-projects' -l projects -d 'Print the projects directory'
complete -c notes -n '__fish_seen_subcommand_from root; and not __fish_contains_opt projects no-projects' -l no-projects -d 'Disable projects'
complete -c notes -n '__fish_seen_subcommand_from root; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt projects no-projects' -f -a '--projects' -d 'Print the projects directory'
complete -c notes -n '__fish_seen_subcommand_from root; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt projects no-projects' -f -a '--no-projects' -d 'Disable projects'
complete -c notes -n '__fish_seen_subcommand_from context' -f
complete -c notes -n '__fish_seen_subcommand_from context; and begin; not __fish_contains_opt command; or contains -- (commandline -poc)[-1] --command; end' -l command -d 'Integration command name requesting context' -r -f
complete -c notes -n '__fish_seen_subcommand_from context; and not __fish_contains_opt json no-json' -l json -d 'Emit structured context JSON'
complete -c notes -n '__fish_seen_subcommand_from context; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from context; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt command' -f -a '--command' -d 'Integration command name requesting context'
complete -c notes -n '__fish_seen_subcommand_from context; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit structured context JSON'
complete -c notes -n '__fish_seen_subcommand_from context; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from list' -f
complete -c notes -n '__fish_seen_subcommand_from list; and not __fish_contains_opt all no-all' -l all -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from list; and not __fish_contains_opt all no-all' -l no-all -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from list; and begin; not __fish_contains_opt tag; or contains -- (commandline -poc)[-1] --tag; end' -l tag -d 'Only include notes with this tag' -r -f
complete -c notes -n '__fish_seen_subcommand_from list; and begin; not __fish_contains_opt format; or contains -- (commandline -poc)[-1] --format; end' -l format -d 'Output format' -r -f -a 'labels json'
complete -c notes -n '__fish_seen_subcommand_from list; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--all' -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from list; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--no-all' -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from list; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt tag' -f -a '--tag' -d 'Only include notes with this tag'
complete -c notes -n '__fish_seen_subcommand_from list; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt format' -f -a '--format' -d 'Output format'
complete -c notes -n '__fish_seen_subcommand_from search' -f
complete -c notes -n '__fish_seen_subcommand_from search; and begin; not __fish_contains_opt query; or contains -- (commandline -poc)[-1] --query; end' -l query -d 'Fuzzy search text' -r -f
complete -c notes -n '__fish_seen_subcommand_from search; and not __fish_contains_opt all no-all' -l all -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from search; and not __fish_contains_opt all no-all' -l no-all -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from search; and begin; not __fish_contains_opt tag; or contains -- (commandline -poc)[-1] --tag; end' -l tag -d 'Only include notes with this tag' -r -f
complete -c notes -n '__fish_seen_subcommand_from search; and begin; not __fish_contains_opt format; or contains -- (commandline -poc)[-1] --format; end' -l format -d 'Output format' -r -f -a 'labels json'
complete -c notes -n '__fish_seen_subcommand_from search; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt query' -f -a '--query' -d 'Fuzzy search text'
complete -c notes -n '__fish_seen_subcommand_from search; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--all' -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from search; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--no-all' -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from search; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt tag' -f -a '--tag' -d 'Only include notes with this tag'
complete -c notes -n '__fish_seen_subcommand_from search; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt format' -f -a '--format' -d 'Output format'
complete -c notes -n '__fish_seen_subcommand_from read' -f
complete -c notes -n '__fish_seen_subcommand_from read; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from read; and not __fish_contains_opt json no-json' -l json -d 'Emit content and revision hash as JSON'
complete -c notes -n '__fish_seen_subcommand_from read; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from read; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from read; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit content and revision hash as JSON'
complete -c notes -n '__fish_seen_subcommand_from read; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from write' -f
complete -c notes -n '__fish_seen_subcommand_from write; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from write; and not __fish_contains_opt stdin no-stdin' -l stdin -d 'Read note content from stdin'
complete -c notes -n '__fish_seen_subcommand_from write; and not __fish_contains_opt stdin no-stdin' -l no-stdin -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from write; and begin; not __fish_contains_opt expected-hash; or contains -- (commandline -poc)[-1] --expected-hash; end' -l expected-hash -d 'Fail if the existing note no longer has this SHA-256 hash' -r -f
complete -c notes -n '__fish_seen_subcommand_from write; and not __fish_contains_opt json no-json' -l json -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from write; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--stdin' -d 'Read note content from stdin'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--no-stdin' -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt expected-hash' -f -a '--expected-hash' -d 'Fail if the existing note no longer has this SHA-256 hash'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from write; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from delete' -f
complete -c notes -n '__fish_seen_subcommand_from delete; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from delete; and not __fish_contains_opt json no-json' -l json -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from delete; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from delete; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from delete; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from delete; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from move' -f
complete -c notes -n '__fish_seen_subcommand_from move; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from move; and begin; not __fish_contains_opt to; or contains -- (commandline -poc)[-1] --to; end' -l to -d 'Existing or remembered repository scope' -r -f
complete -c notes -n '__fish_seen_subcommand_from move; and not __fish_contains_opt json no-json' -l json -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from move; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from move; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from move; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt to' -f -a '--to' -d 'Existing or remembered repository scope'
complete -c notes -n '__fish_seen_subcommand_from move; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the complete mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from move; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from create' -f
complete -c notes -n '__fish_seen_subcommand_from create; and begin; not __fish_contains_opt repository; or contains -- (commandline -poc)[-1] --repository; end' -l repository -d 'Repository scope for the new note' -r -f
complete -c notes -n '__fish_seen_subcommand_from create; and begin; not __fish_contains_opt kind; or contains -- (commandline -poc)[-1] --kind; end' -l kind -d 'Note template kind' -r -f -a 'note handoff'
complete -c notes -n '__fish_seen_subcommand_from create; and begin; not __fish_contains_opt name; or contains -- (commandline -poc)[-1] --name; end' -l name -d 'Note name' -r -f
complete -c notes -n '__fish_seen_subcommand_from create; and begin; not __fish_contains_opt description; or contains -- (commandline -poc)[-1] --description; end' -l description -d 'Note description' -r -f
complete -c notes -n '__fish_seen_subcommand_from create; and not __fish_contains_opt stdin no-stdin' -l stdin -d 'Read the note body from stdin'
complete -c notes -n '__fish_seen_subcommand_from create; and not __fish_contains_opt stdin no-stdin' -l no-stdin -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from create; and not __fish_contains_opt json no-json' -l json -d 'Emit the complete create result as JSON'
complete -c notes -n '__fish_seen_subcommand_from create; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt repository' -f -a '--repository' -d 'Repository scope for the new note'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt kind' -f -a '--kind' -d 'Note template kind'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt name' -f -a '--name' -d 'Note name'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt description' -f -a '--description' -d 'Note description'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--stdin' -d 'Read the note body from stdin'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--no-stdin' -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the complete create result as JSON'
complete -c notes -n '__fish_seen_subcommand_from create; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from targets' -f
complete -c notes -n '__fish_seen_subcommand_from targets; and begin; not __fish_contains_opt format; or contains -- (commandline -poc)[-1] --format; end' -l format -d 'Output format' -r -f -a 'labels json'
complete -c notes -n '__fish_seen_subcommand_from targets; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt format' -f -a '--format' -d 'Output format'
complete -c notes -n '__fish_seen_subcommand_from agents' -f
complete -c notes -n '__fish_seen_subcommand_from agents; and begin; not __fish_contains_opt format; or contains -- (commandline -poc)[-1] --format; end' -l format -d 'Output format' -r -f -a 'labels json'
complete -c notes -n '__fish_seen_subcommand_from agents; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt format' -f -a '--format' -d 'Output format'
complete -c notes -n '__fish_seen_subcommand_from priority' -f
complete -c notes -n '__fish_seen_subcommand_from priority; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from priority; and begin; not __fish_contains_opt value; or contains -- (commandline -poc)[-1] --value; end' -l value -d 'New priority' -r -f -a 'low medium high critical'
complete -c notes -n '__fish_seen_subcommand_from priority; and not __fish_contains_opt json no-json' -l json -d 'Emit the mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from priority; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from priority; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from priority; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt value' -f -a '--value' -d 'New priority'
complete -c notes -n '__fish_seen_subcommand_from priority; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the mutation result as JSON'
complete -c notes -n '__fish_seen_subcommand_from priority; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from open-agent' -f
complete -c notes -n '__fish_seen_subcommand_from open-agent; and begin; not __fish_contains_opt path; or contains -- (commandline -poc)[-1] --path; end' -l path -d 'Absolute path to a note file inside the notes vault' -r -F
complete -c notes -n '__fish_seen_subcommand_from open-agent; and begin; not __fish_contains_opt agent; or contains -- (commandline -poc)[-1] --agent; end' -l agent -d 'Command from notes agents' -r -f
complete -c notes -n '__fish_seen_subcommand_from open-agent; and begin; not __fish_contains_opt mode; or contains -- (commandline -poc)[-1] --mode; end' -l mode -d 'Agent opening mode' -r -f -a 'default plan'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not __fish_contains_opt json no-json' -l json -d 'Emit the opened workspace and tab IDs'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt path' -f -a '--path' -d 'Absolute path to a note file inside the notes vault'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt agent' -f -a '--agent' -d 'Command from notes agents'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt mode' -f -a '--mode' -d 'Agent opening mode'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit the opened workspace and tab IDs'
complete -c notes -n '__fish_seen_subcommand_from open-agent; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from handoffs' -f
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not __fish_contains_opt all no-all' -l all -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not __fish_contains_opt all no-all' -l no-all -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not __fish_contains_opt list no-list' -l list -d 'List handoffs to stdout instead of opening the TUI'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not __fish_contains_opt list no-list' -l no-list -d 'Disable list'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and begin; not __fish_contains_opt format; or contains -- (commandline -poc)[-1] --format; end' -l format -d 'Output format' -r -f -a 'labels json'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--all' -d 'Show notes from every projects directory'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt all no-all' -f -a '--no-all' -d 'Disable all'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt list no-list' -f -a '--list' -d 'List handoffs to stdout instead of opening the TUI'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt list no-list' -f -a '--no-list' -d 'Disable list'
complete -c notes -n '__fish_seen_subcommand_from handoffs; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt format' -f -a '--format' -d 'Output format'
complete -c notes -n '__fish_seen_subcommand_from mcp' -f
complete -c notes -n '__fish_seen_subcommand_from capture' -f
complete -c notes -n '__fish_seen_subcommand_from capture; and begin; not __fish_contains_opt config; or contains -- (commandline -poc)[-1] --config; end' -l config -d 'Daemon YAML configuration path' -r -F
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt status no-status' -l status -d 'Check local processor availability'
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt status no-status' -l no-status -d 'Disable status'
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt stdin no-stdin' -l stdin -d 'Read captured note text from stdin'
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt stdin no-stdin' -l no-stdin -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from capture; and begin; not __fish_contains_opt repository; or contains -- (commandline -poc)[-1] --repository; end' -l repository -d 'Target repository (omit for Automatic)' -r -f
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt json no-json' -l json -d 'Emit a machine-readable result'
complete -c notes -n '__fish_seen_subcommand_from capture; and not __fish_contains_opt json no-json' -l no-json -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt config' -f -a '--config' -d 'Daemon YAML configuration path'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt status no-status' -f -a '--status' -d 'Check local processor availability'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt status no-status' -f -a '--no-status' -d 'Disable status'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--stdin' -d 'Read captured note text from stdin'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt stdin no-stdin' -f -a '--no-stdin' -d 'Disable stdin'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt repository' -f -a '--repository' -d 'Target repository (omit for Automatic)'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--json' -d 'Emit a machine-readable result'
complete -c notes -n '__fish_seen_subcommand_from capture; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt json no-json' -f -a '--no-json' -d 'Disable json'
complete -c notes -n '__fish_seen_subcommand_from daemon' -f
complete -c notes -n '__fish_seen_subcommand_from daemon; and begin; not __fish_contains_opt config; or contains -- (commandline -poc)[-1] --config; end' -l config -d 'Daemon YAML configuration path' -r -F
complete -c notes -n '__fish_seen_subcommand_from daemon; and not __fish_contains_opt once no-once' -l once -d 'Process one queue snapshot and exit'
complete -c notes -n '__fish_seen_subcommand_from daemon; and not __fish_contains_opt once no-once' -l no-once -d 'Disable once'
complete -c notes -n '__fish_seen_subcommand_from daemon; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt config' -f -a '--config' -d 'Daemon YAML configuration path'
complete -c notes -n '__fish_seen_subcommand_from daemon; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt once no-once' -f -a '--once' -d 'Process one queue snapshot and exit'
complete -c notes -n '__fish_seen_subcommand_from daemon; and not string match -q -- "-*" (commandline -ct); and not __fish_contains_opt once no-once' -f -a '--no-once' -d 'Disable once'

###-end-notes-completions-###
