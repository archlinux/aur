#!/bin/bash

#═══════════════════════════════════════════════════════════════════════════════
#  ███████╗██╗  ██╗██╗███████╗██╗     ██╗  ██╗   System Cleaner v1.0
#  ██╔════╝██║  ██║██║██╔════╝██║     ██║  ██║   Advanced Maintenance Tool
#  ███████╗███████║██║█████╗  ██║     ██║  ██║   For Arch Linux Systems
#  ╚════██║██╔══██║██║██╔══╝  ██║     ██║  ██║   
#  ███████║██║  ██║██║███████╗███████╗██████╔╝   Licensed under MIT
#  ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═════╝    
#═══════════════════════════════════════════════════════════════════════════════

set -o pipefail

# Color Palette
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

# Application Metadata
readonly APP_NAME="SHIELD System Cleaner"
readonly APP_VERSION="1.0.0"
readonly APP_AUTHOR="SHIELD Development Team"
readonly APP_LICENSE="MIT"

# Runtime Configuration
INTERACTIVE=true
DRY_RUN=false
VERBOSE=false
AUTO_YES=false
JOURNAL_SIZE="50M"

# Performance Metrics
TOTAL_FREED=0
OPERATIONS_PERFORMED=0
OPERATIONS_SKIPPED=0
START_TIME=$(date +%s)

#═══════════════════════════════════════════════════════════════════════════════
# DISPLAY FUNCTIONS
#═══════════════════════════════════════════════════════════════════════════════

print_header() {
    clear
    echo -e "${CYAN}${BOLD}"
    cat << "EOF"
    ███████╗██╗  ██╗██╗███████╗██╗     ██████╗ 
    ██╔════╝██║  ██║██║██╔════╝██║     ██╔══██╗
    ███████╗███████║██║█████╗  ██║     ██║  ██║
    ╚════██║██╔══██║██║██╔══╝  ██║     ██║  ██║
    ███████║██║  ██║██║███████╗███████╗██████╔╝
    ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═════╝ 
EOF
    echo -e "${NC}${DIM}    ╔════════════════════════════════════════════╗"
    echo -e "    ║   ${NC}${BOLD}System Maintenance & Cleanup Tool${NC}${DIM}      ║"
    echo -e "    ║   ${NC}Version ${APP_VERSION} | ${APP_LICENSE} License${NC}${DIM}            ║"
    echo -e "    ╚════════════════════════════════════════════╝${NC}"
    echo ""
}

print_help() {
    echo -e "${CYAN}${BOLD}"
    cat << "EOF"
    ███████╗██╗  ██╗██╗███████╗██╗     ██████╗ 
    ██╔════╝██║  ██║██║██╔════╝██║     ██╔══██╗
    ███████╗███████║██║█████╗  ██║     ██║  ██║
    ╚════██║██╔══██║██║██╔══╝  ██║     ██║  ██║
    ███████║██║  ██║██║███████╗███████╗██████╔╝
    ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═════╝ 
EOF
    echo -e "${NC}"
    echo -e "${BOLD}USAGE:${NC}"
    echo -e "  $(basename "$0") [OPTIONS]"
    echo ""
    echo -e "${BOLD}OPTIONS:${NC}"
    echo -e "  ${GREEN}-a, --all${NC}           Run all cleanups without prompting"
    echo -e "  ${GREEN}-y, --yes${NC}           Automatic yes to prompts"
    echo -e "  ${GREEN}-d, --dry-run${NC}       Show what would be done without doing it"
    echo -e "  ${GREEN}-v, --verbose${NC}       Enable verbose output"
    echo -e "  ${GREEN}-q, --quiet${NC}         Suppress non-essential output"
    echo -e "  ${GREEN}-h, --help${NC}          Show this help message"
    echo ""
    echo -e "${BOLD}TARGETED OPERATIONS:${NC}"
    echo -e "  ${CYAN}--pacman${NC}            Clean pacman cache only"
    echo -e "  ${CYAN}--yay${NC}               Clean yay cache only"
    echo -e "  ${CYAN}--journal [SIZE]${NC}    Vacuum journal logs (default: 50M)"
    echo -e "  ${CYAN}--thumbnails${NC}        Clear thumbnail cache only"
    echo -e "  ${CYAN}--cache${NC}             Clear user cache only"
    echo -e "  ${CYAN}--temp${NC}              Remove temp files only"
    echo -e "  ${CYAN}--trash${NC}             Empty trash only"
    echo -e "  ${CYAN}--ram${NC}               Drop RAM caches only"
    echo ""
    echo -e "${BOLD}EXAMPLES:${NC}"
    echo -e "  ${DIM}# Interactive mode${NC}"
    echo -e "  $(basename "$0")"
    echo ""
    echo -e "  ${DIM}# Run all cleanups automatically${NC}"
    echo -e "  $(basename "$0") -a"
    echo ""
    echo -e "  ${DIM}# Clean package caches only${NC}"
    echo -e "  $(basename "$0") --pacman --yay"
    echo ""
    echo -e "  ${DIM}# Dry run to preview actions${NC}"
    echo -e "  $(basename "$0") -d"
    echo ""
}

#═══════════════════════════════════════════════════════════════════════════════
# LOGGING FUNCTIONS
#═══════════════════════════════════════════════════════════════════════════════

log_info() {
    echo -e "${BLUE}${BOLD}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}${BOLD}[✓]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}${BOLD}[!]${NC} $1"
}

log_error() {
    echo -e "${RED}${BOLD}[✗]${NC} $1"
}

log_verbose() {
    [[ "$VERBOSE" == true ]] && echo -e "${DIM}    ↳ $1${NC}"
}

log_operation() {
    echo -e "${MAGENTA}${BOLD}[>]${NC} ${BOLD}$1${NC}"
}

print_divider() {
    echo -e "${DIM}────────────────────────────────────────────────${NC}"
}

# Print a summary row that fits the fixed-width summary box (50 inner columns).
print_summary_line() {
    local label="$1"
    local value="$2"
    local value_color="$3"

    local box_inner_width=50
    local right_pad=2
    local left="  ${label}"
    local right="${value}"
    local pad=$((box_inner_width - ${#left} - ${#right} - right_pad))
    (( pad < 1 )) && pad=1

    printf "%b%s%*s%b%s%b%*s%b\n" \
        "${CYAN}${BOLD}║${NC}" "$left" "$pad" "" \
        "${value_color}${BOLD}" "$right" "${NC}" \
        "$right_pad" "" \
        "${CYAN}${BOLD}║${NC}"
}

#═══════════════════════════════════════════════════════════════════════════════
# UTILITY FUNCTIONS
#═══════════════════════════════════════════════════════════════════════════════


get_size() {
    local path="$1"
    if [[ -d "$path" ]] || [[ -f "$path" ]]; then
        du -sb "$path" 2>/dev/null | awk '{print $1}'
    else
        echo "0"
    fi
}

format_size() {
    local bytes=$1
    if (( bytes > 1073741824 )); then
        echo "$(awk "BEGIN {printf \"%.2f\", $bytes/1073741824}")GB"
    elif (( bytes > 1048576 )); then
        echo "$(awk "BEGIN {printf \"%.2f\", $bytes/1048576}")MB"
    elif (( bytes > 1024 )); then
        echo "$(awk "BEGIN {printf \"%.2f\", $bytes/1024}")KB"
    else
        echo "${bytes}B"
    fi
}

ask() {
    [[ "$AUTO_YES" == true ]] && return 0
    echo -en "${YELLOW}${BOLD}[?]${NC} $1 ${DIM}(y/N)${NC}: "
    read -r REPLY
    [[ "$REPLY" =~ ^[Yy]$ ]]
}

run_cleanup() {
    local name="$1"
    local command="$2"
    local before_size="${3:-0}"
    
    if [[ "$DRY_RUN" == true ]]; then
        log_info "[DRY RUN] Would execute: $name"
        return 0
    fi
    
    log_verbose "Executing: $name"
    if eval "$command" 2>&1 | grep -v "^$" | while IFS= read -r line; do log_verbose "$line"; done; then
        local after_size="${4:-0}"
        local freed=$((before_size - after_size))
        TOTAL_FREED=$((TOTAL_FREED + freed))
        OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
        log_success "$name - Freed: $(format_size $freed)"
        return 0
    else
        log_error "$name failed"
        return 1
    fi
}

# Parse arguments
CLEAN_PACMAN=false
CLEAN_YAY=false
CLEAN_JOURNAL=false
CLEAN_THUMBNAILS=false
CLEAN_CACHE=false
CLEAN_TEMP=false
CLEAN_TRASH=false
CLEAN_RAM=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_help
            exit 0
            ;;
        -a|--all)
            AUTO_YES=true
            CLEAN_PACMAN=true
            CLEAN_YAY=true
            CLEAN_JOURNAL=true
            CLEAN_THUMBNAILS=true
            CLEAN_CACHE=true
            CLEAN_TEMP=true
            CLEAN_TRASH=true
            CLEAN_RAM=true
            shift
            ;;
        -y|--yes)
            AUTO_YES=true
            shift
            ;;
        -d|--dry-run)
            DRY_RUN=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -q|--quiet)
            INTERACTIVE=false
            shift
            ;;
        --pacman)
            CLEAN_PACMAN=true
            shift
            ;;
        --yay)
            CLEAN_YAY=true
            shift
            ;;
        --journal)
            CLEAN_JOURNAL=true
            if [[ -n "$2" ]] && [[ ! "$2" =~ ^- ]]; then
                JOURNAL_SIZE="$2"
                shift
            fi
            shift
            ;;
        --thumbnails)
            CLEAN_THUMBNAILS=true
            shift
            ;;
        --cache)
            CLEAN_CACHE=true
            shift
            ;;
        --temp)
            CLEAN_TEMP=true
            shift
            ;;
        --trash)
            CLEAN_TRASH=true
            shift
            ;;
        --ram)
            CLEAN_RAM=true
            shift
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            print_help
            exit 1
            ;;
    esac
done

#═══════════════════════════════════════════════════════════════════════════════
# MAIN PROGRAM EXECUTION
#═══════════════════════════════════════════════════════════════════════════════

# If no specific cleanup selected, run interactive mode
if [[ "$CLEAN_PACMAN" == false ]] && [[ "$CLEAN_YAY" == false ]] && \
   [[ "$CLEAN_JOURNAL" == false ]] && [[ "$CLEAN_THUMBNAILS" == false ]] && \
   [[ "$CLEAN_CACHE" == false ]] && [[ "$CLEAN_TEMP" == false ]] && \
   [[ "$CLEAN_TRASH" == false ]] && [[ "$CLEAN_RAM" == false ]]; then
    INTERACTIVE=true
fi

# Initialize display
print_header

# Display runtime mode
if [[ "$DRY_RUN" == true ]]; then
    echo -e "${YELLOW}${BOLD}╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}${BOLD}║          DRY RUN MODE - NO CHANGES MADE          ║${NC}"
    echo -e "${YELLOW}${BOLD}╚══════════════════════════════════════════════════╝${NC}"
    echo ""
fi

if [[ "$VERBOSE" == true ]]; then
    log_info "Verbose mode enabled"
fi

if [[ "$AUTO_YES" == true ]]; then
    log_info "Auto-yes mode enabled"
fi

echo -e "${BOLD}System Cleanup Operations:${NC}"
print_divider
echo ""

#═══════════════════════════════════════════════════════════════════════════════
# CLEANUP OPERATIONS
#═══════════════════════════════════════════════════════════════════════════════

# Pacman cache cleanup
if [[ "$CLEAN_PACMAN" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clean pacman package cache?"; }; then
    log_operation "Pacman Cache Cleanup"
    before=$(get_size "/var/cache/pacman/pkg/")
    log_info "Cleaning pacman cache..."
    sudo find /var/cache/pacman/pkg/ -mindepth 1 -type d -exec rm -rf {} + 2>/dev/null || true
    if [[ "$DRY_RUN" == false ]]; then
        yes | sudo pacman -Scc 2>&1 | grep -v "^$" | while IFS= read -r line; do log_verbose "$line"; done
    fi
    after=$(get_size "/var/cache/pacman/pkg/")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Pacman cache cleaned - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped pacman cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# Yay cache cleanup
if command -v yay >/dev/null 2>&1; then
    if [[ "$CLEAN_YAY" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clean yay AUR cache?"; }; then
        log_operation "Yay AUR Cache Cleanup"
        before=$(get_size "/var/cache/pacman/pkg/")
        before=$((before + $(get_size "$HOME/.cache/yay")))
        log_info "Cleaning yay cache..."
        sudo find /var/cache/pacman/pkg/ -mindepth 1 -type d -exec rm -rf {} + 2>/dev/null || true
        if [[ "$DRY_RUN" == false ]]; then
            yes | yay -Scc 2>&1 | grep -v "^$" | while IFS= read -r line; do log_verbose "$line"; done
        fi
        after=$(get_size "/var/cache/pacman/pkg/")
        after=$((after + $(get_size "$HOME/.cache/yay")))
        freed=$((before - after))
        TOTAL_FREED=$((TOTAL_FREED + freed))
        OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
        log_success "Yay cache cleaned - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
    else
        [[ "$INTERACTIVE" == true ]] && log_info "Skipped yay cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
    fi
    print_divider
fi

# Journal logs
if [[ "$CLEAN_JOURNAL" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Reduce system journal logs to $JOURNAL_SIZE?"; }; then
    log_operation "System Journal Cleanup"
    log_info "Vacuuming journal logs..."
    if [[ "$DRY_RUN" == false ]]; then
        output=$(sudo journalctl --vacuum-size=$JOURNAL_SIZE 2>&1)
        freed_amount=$(echo "$output" | grep -oP 'freed \K[0-9.]+[A-Z]+' | tail -1)
        echo "$output" | while IFS= read -r line; do log_verbose "$line"; done
        if [[ -n "$freed_amount" ]]; then
            log_success "Journal logs vacuumed - Freed: ${GREEN}${BOLD}$freed_amount${NC}"
        else
            log_success "Journal logs vacuumed"
        fi
    else
        log_success "Journal logs would be vacuumed to $JOURNAL_SIZE"
    fi
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped journal vacuum" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# Thumbnail cache
if [[ "$CLEAN_THUMBNAILS" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Remove thumbnail cache?"; }; then
    log_operation "Thumbnail Cache Cleanup"
    before=$(get_size "$HOME/.cache/thumbnails")
    log_info "Clearing thumbnail cache..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.cache/thumbnails/*
    after=$(get_size "$HOME/.cache/thumbnails")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Thumbnail cache cleared - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped thumbnail cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# User cache
if [[ "$CLEAN_CACHE" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clear ~/.cache directory?"; }; then
    log_operation "User Cache Cleanup"
    before=$(get_size "$HOME/.cache")
    log_info "Clearing user cache..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.cache/*
    after=$(get_size "$HOME/.cache")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "User cache cleared - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped user cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# Temp files
if [[ "$CLEAN_TEMP" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Delete /tmp and /var/tmp temporary files?"; }; then
    log_operation "Temporary Files Cleanup"
    before=$(($(get_size "/tmp") + $(get_size "/var/tmp")))
    log_info "Removing temp files..."
    if [[ "$DRY_RUN" == false ]]; then
        sudo rm -rf /tmp/*
        sudo rm -rf /var/tmp/* 2>/dev/null
    fi
    after=$(($(get_size "/tmp") + $(get_size "/var/tmp")))
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Temp files removed - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped temp files" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# Trash
if [[ "$CLEAN_TRASH" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Empty system trash?"; }; then
    log_operation "System Trash Cleanup"
    before=$(get_size "$HOME/.local/share/Trash")
    log_info "Emptying trash..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.local/share/Trash/*
    after=$(get_size "$HOME/.local/share/Trash")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Trash emptied - Freed: ${GREEN}${BOLD}$(format_size $freed)${NC}"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped trash" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# RAM cache drop
if [[ "$CLEAN_RAM" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Drop RAM caches (sync && echo 3)?"; }; then
    log_operation "RAM Cache Drop"
    log_info "Dropping memory caches..."
    if [[ "$DRY_RUN" == false ]]; then
        sudo sync
        echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
    fi
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Memory cache dropped"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped RAM cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
print_divider

# Calculate runtime
END_TIME=$(date +%s)
RUNTIME=$((END_TIME - START_TIME))

#═══════════════════════════════════════════════════════════════════════════════
# FINAL SUMMARY
#═══════════════════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║              OPERATION SUMMARY                   ║${NC}"
echo -e "${CYAN}${BOLD}╠══════════════════════════════════════════════════╣${NC}"
print_summary_line "Operations Performed:" "$OPERATIONS_PERFORMED" "$GREEN"
[[ "$OPERATIONS_SKIPPED" -gt 0 ]] && print_summary_line "Operations Skipped:" "$OPERATIONS_SKIPPED" "$YELLOW"
print_summary_line "Total Space Freed:" "$(format_size $TOTAL_FREED)" "$GREEN"
print_summary_line "Execution Time:" "${RUNTIME}s" "$BLUE"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}${BOLD}    ╔═══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}    ║   System Cleanup Complete - Stay Secure   ║${NC}"
echo -e "${GREEN}${BOLD}    ╚═══════════════════════════════════════════╝${NC}"
echo ""

