#!/bin/bash

# SHIELD Interactive System Cleaner
# Advanced system maintenance tool for Arch Linux
# Version 1.0

set -o pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Configuration
INTERACTIVE=true
DRY_RUN=false
VERBOSE=false
AUTO_YES=false
JOURNAL_SIZE="50M"

# Statistics
TOTAL_FREED=0
OPERATIONS_PERFORMED=0
OPERATIONS_SKIPPED=0

# Functions
print_header() {
    echo -e "${CYAN}${BOLD}"
    echo "╔════════════════════════════════════════╗"
    echo "║   SHIELD System Cleaner v1.0           ║"
    echo "║   Advanced Maintenance Tool            ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_help() {
    cat << EOF
Usage: $(basename "$0") [OPTIONS]

Options:
    -a, --all           Run all cleanups without prompting
    -y, --yes           Automatic yes to prompts
    -d, --dry-run       Show what would be done without doing it
    -v, --verbose       Enable verbose output
    -q, --quiet         Suppress non-essential output
    -h, --help          Show this help message
    
    --pacman            Clean pacman cache only
    --yay               Clean yay cache only
    --journal [SIZE]    Vacuum journal logs (default: 50M)
    --thumbnails        Clear thumbnail cache only
    --cache             Clear user cache only
    --temp              Remove temp files only
    --trash             Empty trash only
    --ram               Drop RAM caches only

Examples:
    $(basename "$0")                    # Interactive mode
    $(basename "$0") -a                 # Run all cleanups automatically
    $(basename "$0") --pacman --yay     # Clean package caches only
    $(basename "$0") -d                 # Dry run to preview actions

EOF
}

log_info() {
    echo -e "${BLUE}➜${NC} $1"
}

log_success() {
    echo -e "${GREEN}✔${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

log_verbose() {
    [[ "$VERBOSE" == true ]] && echo -e "${CYAN}  ↳${NC} $1"
}

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
    read -rp "$(echo -e "${YELLOW}?${NC}") $1 (y/N): " REPLY
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

# If no specific cleanup selected, run interactive mode
if [[ "$CLEAN_PACMAN" == false ]] && [[ "$CLEAN_YAY" == false ]] && \
   [[ "$CLEAN_JOURNAL" == false ]] && [[ "$CLEAN_THUMBNAILS" == false ]] && \
   [[ "$CLEAN_CACHE" == false ]] && [[ "$CLEAN_TEMP" == false ]] && \
   [[ "$CLEAN_TRASH" == false ]] && [[ "$CLEAN_RAM" == false ]]; then
    INTERACTIVE=true
fi

print_header

[[ "$DRY_RUN" == true ]] && log_warning "DRY RUN MODE - No changes will be made"
echo

# Pacman cache cleanup
if [[ "$CLEAN_PACMAN" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clean pacman package cache?"; }; then
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
    log_success "Pacman cache cleaned - Freed: $(format_size $freed)"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped pacman cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
echo

# Yay cache cleanup
if command -v yay >/dev/null 2>&1; then
    if [[ "$CLEAN_YAY" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clean yay AUR cache?"; }; then
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
        log_success "Yay cache cleaned - Freed: $(format_size $freed)"
    else
        [[ "$INTERACTIVE" == true ]] && log_info "Skipped yay cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
    fi
    echo
fi

# Journal logs
if [[ "$CLEAN_JOURNAL" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Reduce system journal logs to $JOURNAL_SIZE?"; }; then
    log_info "Vacuuming journal logs..."
    if [[ "$DRY_RUN" == false ]]; then
        output=$(sudo journalctl --vacuum-size=$JOURNAL_SIZE 2>&1)
        freed_amount=$(echo "$output" | grep -oP 'freed \K[0-9.]+[A-Z]+' | tail -1)
        echo "$output" | while IFS= read -r line; do log_verbose "$line"; done
        if [[ -n "$freed_amount" ]]; then
            log_success "Journal logs vacuumed - Freed: $freed_amount"
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
echo

# Thumbnail cache
if [[ "$CLEAN_THUMBNAILS" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Remove thumbnail cache?"; }; then
    before=$(get_size "$HOME/.cache/thumbnails")
    log_info "Clearing thumbnail cache..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.cache/thumbnails/*
    after=$(get_size "$HOME/.cache/thumbnails")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Thumbnail cache cleared - Freed: $(format_size $freed)"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped thumbnail cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
echo

# User cache
if [[ "$CLEAN_CACHE" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Clear ~/.cache directory?"; }; then
    before=$(get_size "$HOME/.cache")
    log_info "Clearing user cache..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.cache/*
    after=$(get_size "$HOME/.cache")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "User cache cleared - Freed: $(format_size $freed)"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped user cache" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
echo

# Temp files
if [[ "$CLEAN_TEMP" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Delete /tmp and /var/tmp temporary files?"; }; then
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
    log_success "Temp files removed - Freed: $(format_size $freed)"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped temp files" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
echo

# Trash
if [[ "$CLEAN_TRASH" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Empty system trash?"; }; then
    before=$(get_size "$HOME/.local/share/Trash")
    log_info "Emptying trash..."
    [[ "$DRY_RUN" == false ]] && rm -rf ~/.local/share/Trash/*
    after=$(get_size "$HOME/.local/share/Trash")
    freed=$((before - after))
    TOTAL_FREED=$((TOTAL_FREED + freed))
    OPERATIONS_PERFORMED=$((OPERATIONS_PERFORMED + 1))
    log_success "Trash emptied - Freed: $(format_size $freed)"
else
    [[ "$INTERACTIVE" == true ]] && log_info "Skipped trash" && OPERATIONS_SKIPPED=$((OPERATIONS_SKIPPED + 1))
fi
echo

# RAM cache drop
if [[ "$CLEAN_RAM" == true ]] || { [[ "$INTERACTIVE" == true ]] && ask "Drop RAM caches (sync && echo 3)?"; }; then
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
echo

# Summary
echo -e "${CYAN}${BOLD}╔════════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD}║          Operation Summary             ║${NC}"
echo -e "${CYAN}${BOLD}╠════════════════════════════════════════╣${NC}"
echo -e "${CYAN}${BOLD}║${NC} Operations performed: ${GREEN}${OPERATIONS_PERFORMED}${NC}"
[[ "$OPERATIONS_SKIPPED" -gt 0 ]] && echo -e "${CYAN}${BOLD}║${NC} Operations skipped:   ${YELLOW}${OPERATIONS_SKIPPED}${NC}"
echo -e "${CYAN}${BOLD}║${NC} Total space freed:    ${GREEN}$(format_size $TOTAL_FREED)${NC}"
echo -e "${CYAN}${BOLD}╚════════════════════════════════════════╝${NC}"
echo
echo -e "${GREEN}${BOLD}You're in control.${NC}"
echo
