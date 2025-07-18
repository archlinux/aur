#!/bin/bash

# focusX - Pomodoro Timer Script for Arch Linux (Bash)
# Dependencies: timer (https://github.com/caarlos0/timer)
# Optional: lolcat, notify-send, spd-say

# Configuration - Edit these times as needed
declare -A pomo_options
pomo_options=(
    ["work"]=45
    ["break"]=10
    ["longbreak"]=30
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ASCII Art Banner
show_banner() {
    if command -v lolcat &> /dev/null; then
        cat << 'EOF' | lolcat
   ___                    _  __
  / __/___  ____  __  ___| |/ /
 / _// _ \/ __/ / / / __/   /
/_/  \___/\__/  \_,_/\__/_/|_|

🍅 Pomodoro Timer - Stay Focused, Stay Productive
EOF
    else
        echo -e "${CYAN}"
        cat << 'EOF'
   ___                    _  __
  / __/___  ____  __  ___| |/ /
 / _// _ \/ __/ / / / __/   /
/_/  \___/\__/  \_,_/\__/_/|_|

EOF
        echo -e "${CYAN}🍅 Pomodoro Timer - Stay Focused, Stay Productive${NC}"
    fi
    echo ""
}

# Check if required dependencies are available
check_dependencies() {
    local missing_deps=()

    if ! command -v timer &> /dev/null; then
        missing_deps+=("timer")
    fi

    if [[ ${#missing_deps[@]} -ne 0 ]]; then
        echo -e "${RED}❌ Missing dependencies: ${missing_deps[*]}${NC}"
        echo -e "${YELLOW}💡 Install timer with: go install github.com/caarlos0/timer@latest${NC}"
        echo -e "${YELLOW}💡 Make sure \$(go env GOPATH)/bin is in your PATH${NC}"
        return 1
    fi
    return 0
}

# Enhanced display function with better formatting
display_session() {
    local session_type="$1"
    local duration="$2"

    # Clear screen for better focus
    clear

    local message="🍅 Starting ${session_type} session (${duration} minutes)"

    # Try lolcat first, fallback to colored echo
    if command -v lolcat &> /dev/null; then
        echo "$message" | lolcat
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
    else
        case "$session_type" in
            "work")
                echo -e "${GREEN}$message${NC}"
                echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                ;;
            "break")
                echo -e "${BLUE}$message${NC}"
                echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                ;;
            "longbreak")
                echo -e "${YELLOW}$message${NC}"
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                ;;
        esac
    fi

    # Show motivational message
    case "$session_type" in
        "work")
            echo -e "${GREEN}💪 Focus time! Deep work mode activated!${NC}"
            echo -e "${GREEN}🎯 Eliminate distractions and get in the zone${NC}"
            ;;
        "break")
            echo -e "${BLUE}☕ Time to relax and recharge!${NC}"
            echo -e "${BLUE}🧘 Step away from the screen, stretch, hydrate${NC}"
            ;;
        "longbreak")
            echo -e "${YELLOW}🌟 Extended break time - you've earned it!${NC}"
            echo -e "${YELLOW}🚶 Take a walk, grab a snack, clear your mind${NC}"
            ;;
    esac

    echo ""
}

# Enhanced notification function with better UX
notify_completion() {
    local session_type="$1"
    local message="$session_type session completed!"

    # Clear screen and show completion
    clear
    echo ""

    # Animated completion message
    if command -v lolcat &> /dev/null; then
        echo "🎉 ================================== 🎉" | lolcat
        echo "     $message" | lolcat
        echo "🎉 ================================== 🎉" | lolcat
    else
        case "$session_type" in
            "work") color="$GREEN" ;;
            "break"|"longbreak") color="$BLUE" ;;
            *) color="$NC" ;;
        esac
        echo -e "${color}🎉 ================================== 🎉${NC}"
        echo -e "${color}     $message${NC}"
        echo -e "${color}🎉 ================================== 🎉${NC}"
    fi

    echo ""

    # Desktop notification (works on most Linux systems)
    if command -v notify-send &> /dev/null; then
        case "$session_type" in
            "work")
                notify-send "🍅 focusX Timer" "Work session complete! Time for a break." -t 5000 -u normal
                ;;
            "break")
                notify-send "🍅 focusX Timer" "Break complete! Ready to work?" -t 5000 -u normal
                ;;
            "longbreak")
                notify-send "🍅 focusX Timer" "Long break complete! Feeling refreshed?" -t 5000 -u normal
                ;;
        esac
    fi

    # Text-to-speech (optional, fails silently if not available)
    if command -v spd-say &> /dev/null; then
        spd-say "$message" 2>/dev/null &
    elif command -v say &> /dev/null; then  # macOS
        say "$message" 2>/dev/null &
    fi

    # Visual/audio bell
    echo -e "\a"

    # Show next action suggestions
    case "$session_type" in
        "work")
            echo -e "${BLUE}💡 What's next?${NC}"
            echo -e "${BLUE}   • 'br' for a short break (${pomo_options[break]} min)${NC}"
            echo -e "${BLUE}   • 'lb' for a long break (${pomo_options[longbreak]} min)${NC}"
            ;;
        "break"|"longbreak")
            echo -e "${GREEN}💡 What's next?${NC}"
            echo -e "${GREEN}   • 'wo' to start working (${pomo_options[work]} min)${NC}"
            echo -e "${GREEN}   • 'qwo' for quick start with confirmation${NC}"
            ;;
    esac
    echo ""
}

# Main pomodoro function with enhanced error handling
pomodoro() {
    # Check dependencies first
    if ! check_dependencies; then
        return 1
    fi

    # Show help if no argument provided
    if [[ -z "$1" ]]; then
        echo -e "${CYAN}🍅 focusX Timer Usage:${NC}"
        echo "  pomodoro [session_type]"
        echo ""
        echo -e "${CYAN}Available sessions:${NC}"
        for key in "${!pomo_options[@]}"; do
            case "$key" in
                "work") icon="💼" ;;
                "break") icon="☕" ;;
                "longbreak") icon="🌟" ;;
                *) icon="⏰" ;;
            esac
            echo "  $icon $key: ${pomo_options[$key]} minutes"
        done
        echo ""
        echo -e "${CYAN}Quick commands:${NC}"
        echo "  wo, br, lb, pstatus, qwo"
        return 1
    fi

    # Check if session type exists
    if [[ -z "${pomo_options[$1]}" ]]; then
        echo -e "${RED}❌ Unknown session type: $1${NC}"
        echo -e "${YELLOW}Available options: ${!pomo_options[*]}${NC}"
        return 1
    fi

    local session_type="$1"
    local duration=${pomo_options[$session_type]}

    # Display session start
    display_session "$session_type" "$duration"

    # Show timer info
    local start_time=$(date '+%H:%M:%S')
    local end_time=$(date -d "+${duration} minutes" '+%H:%M:%S' 2>/dev/null || date -v+${duration}M '+%H:%M:%S' 2>/dev/null)

    echo -e "${PURPLE}⏱️  Started: $start_time${NC}"
    if [[ -n "$end_time" ]]; then
        echo -e "${PURPLE}⏰ Will end: $end_time${NC}"
    fi
    echo -e "${PURPLE}⏲️  Duration: ${duration} minutes${NC}"
    echo ""
    echo -e "${CYAN}💡 Press Ctrl+C to cancel the timer${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    # Start the timer
    if timer ${duration}m; then
        notify_completion "$session_type"
        return 0
    else
        echo ""
        echo -e "${RED}❌ Timer was cancelled or failed${NC}"
        echo -e "${YELLOW}💡 You can restart with the same command${NC}"
        return 1
    fi
}

# Show current configuration with enhanced display
pomo_status() {
    echo -e "${CYAN}🍅 focusX Timer Configuration${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    for key in "${!pomo_options[@]}"; do
        case "$key" in
            "work") icon="💼" color="$GREEN" ;;
            "break") icon="☕" color="$BLUE" ;;
            "longbreak") icon="🌟" color="$YELLOW" ;;
            *) icon="⏰" color="$NC" ;;
        esac
        echo -e "  $icon ${color}$(printf '%-10s' $key): ${pomo_options[$key]} minutes${NC}"
    done

    echo ""
    echo -e "${CYAN}💡 Quick Commands:${NC}"
    echo -e "  ${GREEN}wo${NC}  - Start work session (${pomo_options[work]} min)"
    echo -e "  ${BLUE}br${NC}  - Start break session (${pomo_options[break]} min)"
    echo -e "  ${YELLOW}lb${NC}  - Start long break (${pomo_options[longbreak]} min)"
    echo -e "  ${PURPLE}qwo${NC} - Quick work start with confirmation"
    echo ""
    echo -e "${CYAN}📊 Advanced:${NC}"
    echo -e "  ${PURPLE}pstatus${NC} - Show this configuration"
    echo -e "  ${PURPLE}pomodoro [type]${NC} - Manual session start"
    echo -e "  ${PURPLE}focusX${NC} - Show banner and help"
}

# Quick session starter with confirmation
quick_start() {
    local session_type="$1"

    if [[ -z "${pomo_options[$session_type]}" ]]; then
        echo -e "${RED}❌ Invalid session type: $session_type${NC}"
        return 1
    fi

    echo -e "${YELLOW}🍅 Quick Start: $session_type session (${pomo_options[$session_type]} minutes)${NC}"
    echo -n "Continue? [Y/n] "
    read -r response

    if [[ "$response" =~ ^[Yy]$|^$ ]]; then
        pomodoro "$session_type"
    else
        echo -e "${YELLOW}⏸️  Cancelled.${NC}"
    fi
}

# Main focusX function - shows banner and help
focusX() {
    show_banner

    echo -e "${CYAN}🚀 Quick Start Commands:${NC}"
    echo -e "  ${GREEN}wo${NC}  - Work session (${pomo_options[work]} min)"
    echo -e "  ${BLUE}br${NC}  - Break session (${pomo_options[break]} min)"
    echo -e "  ${YELLOW}lb${NC}  - Long break (${pomo_options[longbreak]} min)"
    echo ""
    echo -e "${CYAN}📊 More Options:${NC}"
    echo -e "  ${PURPLE}pstatus${NC} - Show detailed configuration"
    echo -e "  ${PURPLE}qwo${NC} - Quick work start with confirmation"
    echo ""
    echo -e "${CYAN}💡 Type any command to get started!${NC}"
}

# Function aliases for easy access
alias wo="pomodoro work"
alias br="pomodoro break"
alias lb="pomodoro longbreak"
alias pomo="pomodoro"
alias pstatus="pomo_status"

# Quick start aliases with confirmation
alias qwo="quick_start work"
alias qbr="quick_start break"
alias qlb="quick_start longbreak"

# Bash completion function
_pomodoro_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local opts="work break longbreak"
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}

# Enable completion for pomodoro command
complete -F _pomodoro_complete pomodoro
