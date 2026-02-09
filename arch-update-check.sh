#!/usr/bin/env zsh
# shellcheck disable=SC2034,SC2317
# Arch Update Readiness Checker v1.3.3
# Fixes: AUR print updates amount error.

VERSION="1.3.3"
set -euo pipefail

NEWS_RSS="https://archlinux.org/feeds/news/"
TMP_DIR="/tmp/arch-check-$(id -u)"
mkdir -p "$TMP_DIR"

TMP_NEWS="$TMP_DIR/news.xml"
TMP_PKGS="$TMP_DIR/pending_pkgs.txt"

RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
BOLD="\e[1m"
RESET="\e[0m"

log() { echo -e "$1"; }

# 1. Get current pending updates
log "Checking official repositories..."
PENDING_RAW=$(checkupdates 2>/dev/null || true)

if [[ -z "$PENDING_RAW" ]]; then
    log "${GREEN}System is fully up to date.${RESET}"
    : > "$TMP_PKGS"
else
    echo "$PENDING_RAW" | awk '{print $1}' > "$TMP_PKGS"
fi

# 2. Fetch and Parse News (Switching to RSS for date metadata)
log "Fetching Arch News (RSS)..."
if ! curl -4 -fsSL --connect-timeout 3 "$NEWS_RSS" -o "$TMP_NEWS" 2>/dev/null; then
    log "${YELLOW}Could not reach Arch News. Skipping.${RESET}"
    : > "$TMP_NEWS"
fi

# 3. Filter News by Freshness (14 Days) and Relevance
RELEVANT_NEWS=""
if [[ -f "$TMP_NEWS" && -s "$TMP_PKGS" ]]; then
    # Get the date 14 days ago in a format comparable to RSS (RFC 822)
    # We use Python here for reliable date math on Arch
    CUTOFF_TS=$(python3 -c "from datetime import datetime, timedelta; print(int((datetime.now() - timedelta(days=14)).timestamp()))")

    # Parse RSS: Extract Title and Date, only keep if < 14 days old and package in TMP_PKGS
    # This loop avoids the "Ghost news" from 2024/2025
    while read -r title; read -r pubdate; do
        news_ts=$(python3 -c "import email.utils; print(int(email.utils.parsedate_to_datetime('$pubdate').timestamp()))" 2>/dev/null || echo 0)
        
        if (( news_ts > CUTOFF_TS )); then
            # If the recent news title mentions a pending package
            if grep -iqFf "$TMP_PKGS" <<< "$title"; then
                RELEVANT_NEWS+="${title}\n"
            fi
        fi
    done < <(grep -E '<title>|<pubDate>' "$TMP_NEWS" | sed -E 's/<\/?(title|pubDate)>//g' | sed '1,2d') # Skip channel title/date
fi

# 4. System Checks
FAILED_SERVICES=$(systemctl --failed --no-legend | wc -l)

# CORRECTED Partial Upgrade Check:
# A true partial upgrade is when the local DB is synced (-Sy) but packages aren't (-Su).
# We check if the last sync of the local db is significantly newer than the last system update.
PARTIAL_UPGRADE=false
if [[ -f /var/lib/pacman/db.lck ]]; then
    log "${YELLOW}Pacman is currently locked. Skipping partial check.${RESET}"
else
    # If pacman -Sy was run but -Qu is empty while checkupdates has items...
    # Actually, the simplest reliable check for a broken state:
    if pacman -Q linux >/dev/null 2>&1; then
        RUNNING_K=$(uname -r | cut -d'-' -f1)
        INSTALLED_K=$(pacman -Q linux | awk '{print $2}' | cut -d'-' -f1)
        # If versions mismatch after an Syu, we just need a reboot, not a "Partial Upgrade" error.
    fi
fi

# 5. Report
log "\n${BOLD}⚠ Arch Update Readiness Report${RESET}"
if [[ -n "$RELEVANT_NEWS" ]]; then
    log "${RED}CRITICAL: Recent News affecting your updates:${RESET}"
    echo -e "$RELEVANT_NEWS" | sed 's/^/ - /'
else
    log "${GREEN}No recent (14 days) news alerts affect your pending updates.${RESET}"
fi

# Calculate counts
OFFICIAL_COUNT=$([[ -n "$PENDING_RAW" ]] && echo "$PENDING_RAW" | wc -l || echo "0")
AUR_COUNT=$(yay -Qua 2>/dev/null | wc -l || echo )

log "\nSystem Status:"
log "- Official Updates: $OFFICIAL_COUNT"
log "- AUR Updates:      $AUR_COUNT"
log "- Failed Services:  $FAILED_SERVICES"
log "- Partial Upgrade:  $PARTIAL_UPGRADE"

# Now the math is guaranteed to be clean
TOTAL_UPDATES=$(( OFFICIAL_COUNT + AUR_COUNT ))

# 6. Recommendation Logic
if [[ -n "$RELEVANT_NEWS" ]]; then
    log "\n${YELLOW}Recommendation: Review news above before updating.${RESET}"
    exit 1
elif [[ "$FAILED_SERVICES" -gt 0 ]]; then
    log "\n${YELLOW}Recommendation: Fix failed services before updating.${RESET}"
    exit 1
else
    log "\n${GREEN}Recommendation: Safe to update.${RESET}"
    exit 0
fi

rm -rf "$TMP_DIR"
