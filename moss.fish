# MOSS fish shell completion
# Place this file in ~/.config/fish/completions/moss.fish
# or system-wide at /usr/share/fish/completions/moss.fish

# Global options
complete -c moss -s d -l db-dir -d "Database directory" -f
complete -c moss -l version -d "Show version and exit"
complete -c moss -s h -l help -d "Show help"
complete -c moss -l json -d "JSON output"

# Commands
complete -c moss -f -n '__fish_use_subcommand' -a "
init
status
events
memory
goals
agent
chat
learn
node
protocol
selfop
extensions
update
think
code
sleep
systems
introspect
selfmodel
"

# Global options for all subcommands
complete -c moss -n '__fish_seen_subcommand_from init status events memory goals agent chat learn node protocol selfop extensions update think code sleep systems introspect selfmodel' -s d -l db-dir -d "Database directory" -f
complete -c moss -n '__fish_seen_subcommand_from init status events memory goals agent chat learn node protocol selfop extensions update think code sleep systems introspect selfmodel' -l json -d "JSON output"

# init
complete -c moss -n '__fish_seen_subcommand_from init' -l json -d "JSON output"

# status
complete -c moss -n '__fish_seen_subcommand_from status' -l json -d "JSON output"

# events
complete -c moss -n '__fish_seen_subcommand_from events' -l json -d "JSON output"

# memory
complete -c moss -n '__fish_seen_subcommand_from memory' -l json -d "JSON output"

# goals subcommands
complete -c moss -n '__fish_seen_subcommand_from goals' -f -a "create list complete"
complete -c moss -n '__fish_seen_subcommand_from goals create' -l title -r -d "Goal title"
complete -c moss -n '__fish_seen_subcommand_from goals create' -l priority -d "Priority 1-10" -r
complete -c moss -n '__fish_seen_subcommand_from goals list' -l all -d "Include completed goals"
complete -c moss -n '__fish_seen_subcommand_from goals complete' -r -d "Goal ID" -f

# agent subcommands
complete -c moss -n '__fish_seen_subcommand_from agent' -f -a "status cycle run observe"
complete -c moss -n '__fish_seen_subcommand_from agent status' -l name -d "Agent name" -r
complete -c moss -n '__fish_seen_subcommand_from agent cycle' -l goal -d "Goal title" -r
complete -c moss -n '__fish_seen_subcommand_from agent run' -l steps -d "Number of steps" -r
complete -c moss -n '__fish_seen_subcommand_from agent run' -l goal -d "Goal title" -r
complete -c moss -n '__fish_seen_subcommand_from agent observe' -l message -r -d "Observation message"
complete -c moss -n '__fish_seen_subcommand_from agent observe' -l name -d "Observation name" -r

# chat subcommands
complete -c moss -n '__fish_seen_subcommand_from chat' -f -a "start new send list history interactive approve correct"
complete -c moss -n '__fish_seen_subcommand_from chat start' -l title -d "Conversation title" -r
complete -c moss -n '__fish_seen_subcommand_from chat new' -l title -d "Conversation title" -r
complete -c moss -n '__fish_seen_subcommand_from chat send' -l id -r -d "Conversation ID"
complete -c moss -n '__fish_seen_subcommand_from chat send' -l message -r -d "Message content"
complete -c moss -n '__fish_seen_subcommand_from chat send' -l role -d "Message role" -r -a "user assistant"
complete -c moss -n '__fish_seen_subcommand_from chat send' -l node -d "Node URL" -r
complete -c moss -n '__fish_seen_subcommand_from chat send' -l wait -d "Wait seconds for reply" -r
complete -c moss -n '__fish_seen_subcommand_from chat send' -l offline -d "Store locally only"
complete -c moss -n '__fish_seen_subcommand_from chat send' -l stdin -d "Read from stdin"
complete -c moss -n '__fish_seen_subcommand_from chat history' -l id -r -d "Conversation ID"
complete -c moss -n '__fish_seen_subcommand_from chat interactive' -l title -d "Conversation title" -r
complete -c moss -n '__fish_seen_subcommand_from chat interactive' -l node -d "Node URL" -r
complete -c moss -n '__fish_seen_subcommand_from chat interactive' -l wait -d "Wait seconds" -r
complete -c moss -n '__fish_seen_subcommand_from chat interactive' -l history -d "Show history on startup"
complete -c moss -n '__fish_seen_subcommand_from chat interactive' -l clear-history -d "Fresh start"
complete -c moss -n '__fish_seen_subcommand_from chat approve' -l id -r -d "Conversation ID"
complete -c moss -n '__fish_seen_subcommand_from chat correct' -l id -r -d "Conversation ID"

# learn subcommands
complete -c moss -n '__fish_seen_subcommand_from learn' -f -a "status collect teach backup crystallize gauntlet export-pairs model grow sleep"
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l prompt -r -d "Prompt"
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l response -r -d "Response"
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l type -d "Interaction type" -a "chat task code reasoning planning tool_use"
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l outcome -d "Outcome" -a "success partial failure user_corrected user_approved"
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l reward -d "Reward -1.0 to 1.0" -r
complete -c moss -n '__fish_seen_subcommand_from learn collect' -l quality -d "Quality 0.0 to 1.0" -r
complete -c moss -n '__fish_seen_subcommand_from learn teach' -l fact -r -d "Fact to imprint"
complete -c moss -n '__fish_seen_subcommand_from learn model' -f -a "list deploy rollback eval"

# node subcommands
complete -c moss -n '__fish_seen_subcommand_from node' -f -a "status discover start"
complete -c moss -n '__fish_seen_subcommand_from node status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from node status' -l registry -d "Registry URL" -r
complete -c moss -n '__fish_seen_subcommand_from node status' -l auth-secret -d "Auth secret" -r
complete -c moss -n '__fish_seen_subcommand_from node discover' -l registry -r -d "Registry URL"
complete -c moss -n '__fish_seen_subcommand_from node discover' -l auth-secret -d "Auth secret" -r
complete -c moss -n '__fish_seen_subcommand_from node start' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from node start' -l goal -d "Initial goal" -r
complete -c moss -n '__fish_seen_subcommand_from node start' -l interval -d "Tick interval" -r
complete -c moss -n '__fish_seen_subcommand_from node start' -l registry -d "Registry URL" -r
complete -c moss -n '__fish_seen_subcommand_from node start' -l auth-secret -d "Auth secret" -r

# protocol subcommands
complete -c moss -n '__fish_seen_subcommand_from protocol' -f -a "status start"
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l name -r -d "Node name"
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l bootstrap -d "Bootstrap peer host:port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l interval -d "Heartbeat seconds" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l timeout -d "Peer timeout seconds" -r

# selfop subcommands
complete -c moss -n '__fish_seen_subcommand_from selfop' -f -a "check profile plan status snapshot apply rollback heal run"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l workspace -d "Workspace root" -r
complete -c moss -n '__fish_seen_subcommand_from selfop' -l sudo -d "Allow sudo"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l allow-packages -d "Allow package changes"
complete -c moss -n '__fish_seen_subcommand_from selfop apply' -l commit -d "Apply changes"
complete -c moss -n '__fish_seen_subcommand_from selfop rollback' -l snapshot -d "Snapshot name" -r
complete -c moss -n '__fish_seen_subcommand_from selfop heal' -l commit -d "Repair"
complete -c moss -n '__fish_seen_subcommand_from selfop run' -l commit -d "Apply tuning"

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# update command
complete -c moss -n '__fish_seen_subcommand_from update' -l dry-run -d "Check only"
complete -c moss -n '__fish_seen_subcommand_from update' -l force -d "Skip dirty check"
complete -c moss -n '__fish_seen_subcommand_from update' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from update' -l demo-wheel -d "Demo wheel animation" -r
complete -c moss -n '__fish_seen_subcommand_from update' -l repo -d "Repo path" -r
complete -c moss -n '__fish_seen_subcommand_from update' -l system -d "Use system package manager"
complete -c moss -n '__fish_seen_subcommand_from update' -l mpm -d "Use MPM"

# think command
complete -c moss -n '__fish_seen_subcommand_from think' -l timeout -d "Deliberation timeout" -r
complete -c moss -n '__fish_seen_subcommand_from think' -l json -d "JSON output"

# code command
complete -c moss -n '__fish_seen_subcommand_from code' -l description -d "Override description" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l category -d "ADR-0014 category" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l full-file -d "Whole-file strategy"

# think command (already defined above, but adding positional argument support)
complete -c moss -n '__fish_seen_subcommand_from think' -f -a "question"

# code command (positional argument)
complete -c moss -n '__fish_seen_subcommand_from code' -f -a "instruction"

# node start completions for goal
complete -c moss -n '__fish_seen_subcommand_from node start' -l goal -d "Initial goal" -r

# chat send completions
complete -c moss -n '__fish_seen_subcommand_from chat send' -f -a "message"

# think command argument
complete -c moss -n '__fish_seen_subcommand_from think' -f -a "question"

# code command instruction
complete -c moss -n '__fish_seen_subcommand_from code' -f -a "instruction"

# Global flags available for all commands
complete -c moss -n '__fish_seen_subcommand_from init status events memory goals agent chat learn node protocol selfop extensions update think code sleep systems introspect selfmodel' -l json -d "JSON output"
complete -c moss -n '__fish_seen_subcommand_from init status events memory goals agent chat learn node protocol selfop extensions update think code sleep systems introspect selfmodel' -s d -l db-dir -d "Database directory" -f

# think command arguments
complete -c moss -n '__fish_seen_subcommand_from think' -f -a "question"
complete -c moss -n '__fish_seen_subcommand_from think' -l timeout -d "Deliberation budget in seconds" -r
complete -c moss -n '__fish_seen_subcommand_from think' -l json -d "JSON output"

# code command
complete -c moss -n '__fish_seen_subcommand_from code' -f -a "instruction"
complete -c moss -n '__fish_seen_subcommand_from code' -l description -d "Override description" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l category -d "ADR-0014 category" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l full-file -d "Whole-file replacement strategy" -r

# grow command
complete -c moss -n '__fish_seen_subcommand_from grow' -l status -d "Show status only"
complete -c moss -n '__fish_seen_subcommand_from grow' -l description -d "Override description" -r
complete -c moss -n '__fish_seen_subcommand_from grow' -l category -d "ADR-0014 category" -r
complete -c moss -n '__fish_seen_subcommand_from grow' -l full-file -d "Whole-file replacement strategy" -r

# sleep command
complete -c moss -n '__fish_seen_subcommand_from sleep' -l json -d "JSON output"

# systems command
complete -c moss -n '__fish_seen_subcommand_from systems' -l json -d "JSON output"

# introspect command
complete -c moss -n '__fish_seen_subcommand_from introspect' -l json -d "JSON output"

# selfmodel command
complete -c moss -n '__fish_seen_subcommand_from selfmodel' -l json -d "JSON output"

# protocol subcommands
complete -c moss -n '__fish_seen_subcommand_from protocol' -f -a "status start"
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l name -r -d "Node name"
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l bootstrap -d "Bootstrap peer host:port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l interval -d "Heartbeat seconds" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l timeout -d "Peer timeout seconds" -r

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# selfop subcommands
complete -c moss -n '__fish_seen_subcommand_from selfop' -f -a "check profile plan status snapshot apply rollback heal run"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l workspace -d "Workspace root" -r
complete -c moss -n '__fish_seen_subcommand_from selfop' -l sudo -d "Allow sudo"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l allow-packages -d "Allow package changes"
complete -c moss -n '__fish_seen_subcommand_from selfop apply' -l commit -d "Apply changes"
complete -c moss -n '__fish_seen_subcommand_from selfop rollback' -l snapshot -d "Snapshot name" -r
complete -c moss -n '__fish_seen_subcommand_from selfop heal' -l commit -d "Repair"
complete -c moss -n '__fish_seen_subcommand_from selfop run' -l commit -d "Apply tuning"

# protocol subcommands
complete -c moss -n '__fish_seen_subcommand_from protocol' -f -a "status start"
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l name -r -d "Node name"
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l bootstrap -d "Bootstrap peer host:port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l interval -d "Heartbeat seconds" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l timeout -d "Peer timeout seconds" -r

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# selfop subcommands (duplicate section removed)
# update command
complete -c moss -n '__fish_seen_subcommand_from update' -l dry-run -d "Check only"
complete -c moss -n '__fish_seen_subcommand_from update' -l force -d "Skip dirty check"
complete -c moss -n '__fish_seen_subcommand_from update' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from update' -l demo-wheel -d "Demo wheel animation" -r
complete -c moss -n '__fish_seen_subcommand_from update' -l repo -d "Repo path" -r
complete -c moss -n '__fish_seen_subcommand_from update' -l system -d "Use system package manager"
complete -c moss -n '__fish_seen_subcommand_from update' -l mpm -d "Use MPM"

# think command
complete -c moss -n '__fish_seen_subcommand_from think' -f -a "question"
complete -c moss -n '__fish_seen_subcommand_from think' -l timeout -d "Deliberation budget in seconds" -r
complete -c moss -n '__fish_seen_subcommand_from think' -l json -d "JSON output"

# code command
complete -c moss -n '__fish_seen_subcommand_from code' -f -a "instruction"
complete -c moss -n '__fish_seen_subcommand_from code' -l description -d "Override description" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l category -d "ADR-0014 category" -r
complete -c moss -n '__fish_seen_subcommand_from code' -l full-file -d "Whole-file replacement strategy" -r

# grow command
complete -c moss -n '__fish_seen_subcommand_from grow' -l status -d "Show status only"
complete -c moss -n '__fish_seen_subcommand_from grow' -l description -d "Override description" -r
complete -c moss -n '__fish_seen_subcommand_from grow' -l category -d "ADR-0014 category" -r
complete -c moss -n '__fish_seen_subcommand_from grow' -l full-file -d "Whole-file replacement strategy" -r

# sleep command
complete -c moss -n '__fish_seen_subcommand_from sleep' -l json -d "JSON output"

# systems command
complete -c moss -n '__fish_seen_subcommand_from systems' -l json -d "JSON output"

# introspect command
complete -c moss -n '__fish_seen_subcommand_from introspect' -l json -d "JSON output"

# selfmodel command
complete -c moss -n '__fish_seen_subcommand_from selfmodel' -l json -d "JSON output"

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# selfop subcommands
complete -c moss -n '__fish_seen_subcommand_from selfop' -f -a "check profile plan status snapshot apply rollback heal run"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l workspace -d "Workspace root" -r
complete -c moss -n '__fish_seen_subcommand_from selfop' -l sudo -d "Allow sudo"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l allow-packages -d "Allow package changes"
complete -c moss -n '__fish_seen_subcommand_from selfop apply' -l commit -d "Apply changes"
complete -c moss -n '__fish_seen_subcommand_from selfop rollback' -l snapshot -d "Snapshot name" -r
complete -c moss -n '__fish_seen_subcommand_from selfop heal' -l commit -d "Repair"
complete -c moss -n '__fish_seen_subcommand_from selfop run' -l commit -d "Apply tuning"

# protocol subcommands
complete -c moss -n '__fish_seen_subcommand_from protocol' -f -a "status start"
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l name -r -d "Node name"
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l bootstrap -d "Bootstrap peer host:port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l interval -d "Heartbeat seconds" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l timeout -d "Peer timeout seconds" -r

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# selfop subcommands
complete -c moss -n '__fish_seen_subcommand_from selfop' -f -a "check profile plan status snapshot apply rollback heal run"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l workspace -d "Workspace root" -r
complete -c moss -n '__fish_seen_subcommand_from selfop' -l sudo -d "Allow sudo"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l allow-packages -d "Allow package changes"
complete -c moss -n '__fish_seen_subcommand_from selfop apply' -l commit -d "Apply changes"
complete -c moss -n '__fish_seen_subcommand_from selfop rollback' -l snapshot -d "Snapshot name" -r
complete -c moss -n '__fish_seen_subcommand_from selfop heal' -l commit -d "Repair"
complete -c moss -n '__fish_seen_subcommand_from selfop run' -l commit -d "Apply tuning"

# protocol subcommands
complete -c moss -n '__fish_seen_subcommand_from protocol' -f -a "status start"
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l name -d "Node name" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol status' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l name -r -d "Node name"
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l host -d "Bind host" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l port -d "Bind port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l bootstrap -d "Bootstrap peer host:port" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l interval -d "Heartbeat seconds" -r
complete -c moss -n '__fish_seen_subcommand_from protocol start' -l timeout -d "Peer timeout seconds" -r

# extensions subcommands
complete -c moss -n '__fish_seen_subcommand_from extensions' -f -a "list doctor install remove search update"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions install' -l dry-run -d "Dry run"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l yes -d "Auto-confirm"
complete -c moss -n '__fish_seen_subcommand_from extensions remove' -l dry-run -d "Dry run"

# selfop subcommands
complete -c moss -n '__fish_seen_subcommand_from selfop' -f -a "check profile plan status snapshot apply rollback heal run"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l workspace -d "Workspace root" -r
complete -c moss -n '__fish_seen_subcommand_from selfop' -l sudo -d "Allow sudo"
complete -c moss -n '__fish_seen_subcommand_from selfop' -l allow-packages -d "Allow package changes"
complete -c moss -n '__fish_seen_subcommand_from selfop apply' -l commit -d "Apply changes"
complete -c moss -n '__fish_seen_subcommand_from selfop rollback' -l snapshot -d "Snapshot name" -r
complete -c moss -n '__fish_seen_subcommand_from selfop heal' -l commit -d "Repair"
complete -c moss -n '__fish_seen_subcommand_from selfop run' -l commit -d "Apply tuning"
EOF