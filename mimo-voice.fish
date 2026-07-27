# Fish completion for mimo-voice

# Disable file completions by default
complete -c mimo-voice -f

# Options
complete -c mimo-voice -s l -l list -d "List available voices"
complete -c mimo-voice -s s -l set -d "Set voice" -xa "mimo_default 冰糖 茉莉 苏打 白桦 Mia Chloe Milo Dean"
complete -c mimo-voice -s t -l test -d "Test current voice"
complete -c mimo-voice -s c -l current -d "Show current voice"
complete -c mimo-voice -s h -l help -d "Show help"

# Voice names as positional arguments
complete -c mimo-voice -n '__fish_use_subcommand' -a mimo_default -d "默认女声 (zh)"
complete -c mimo-voice -n '__fish_use_subcommand' -a 冰糖 -d "甜美女声 (zh)"
complete -c mimo-voice -n '__fish_use_subcommand' -a 茉莉 -d "温柔女声 (zh)"
complete -c mimo-voice -n '__fish_use_subcommand' -a 苏打 -d "活力男声 (zh)"
complete -c mimo-voice -n '__fish_use_subcommand' -a 白桦 -d "沉稳男声 (zh)"
complete -c mimo-voice -n '__fish_use_subcommand' -a Mia -d "Female (en)"
complete -c mimo-voice -n '__fish_use_subcommand' -a Chloe -d "Female (en)"
complete -c mimo-voice -n '__fish_use_subcommand' -a Milo -d "Male (en)"
complete -c mimo-voice -n '__fish_use_subcommand' -a Dean -d "Male (en)"
