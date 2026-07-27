# Fish completion for openomen

# Disable file completions by default
complete -c openomen -f

# Main commands
complete -c openomen -n __fish_use_subcommand -a fan -d "Control fan behavior"
complete -c openomen -n __fish_use_subcommand -a cpu -d "Read current CPU stats"
complete -c openomen -n __fish_use_subcommand -a gpu -d "Read current GPU stats"
complete -c openomen -n __fish_use_subcommand -a stats -d "Read all system stats"
complete -c openomen -n __fish_use_subcommand -a info -d "Show system information"
complete -c openomen -n __fish_use_subcommand -a power -d "Manage power profiles"
complete -c openomen -n __fish_use_subcommand -a doctor -d "Check hardware compatibility"
complete -c openomen -n __fish_use_subcommand -a update -d "Update OpenOMEN"

# Global options
complete -c openomen -s h -l help -d "Show help"
complete -c openomen -s v -l version -d "Show version"

# Fan subcommands
complete -c openomen -n '__fish_seen_subcommand_from fan' -a max -d "Fans at maximum RPM"
complete -c openomen -n '__fish_seen_subcommand_from fan' -a auto -d "Auto/BIOS control"
complete -c openomen -n '__fish_seen_subcommand_from fan' -a toggle -d "Toggle fan max on/off"
complete -c openomen -n '__fish_seen_subcommand_from fan' -a status -d "Show current fan status"

# Power subcommands
complete -c openomen -n '__fish_seen_subcommand_from power' -a status -d "Show current power profile"
complete -c openomen -n '__fish_seen_subcommand_from power' -a set -d "Set ACPI power profile"
complete -c openomen -n '__fish_seen_subcommand_from power' -a apply -d "Apply a combined profile"
complete -c openomen -n '__fish_seen_subcommand_from power' -a list -d "List available profiles"

# Stats options
complete -c openomen -n '__fish_seen_subcommand_from stats' -s w -l watch -d "Watch in real-time"
