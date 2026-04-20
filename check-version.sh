#!/usr/bin/env bash
# forge-code version check script — for cron/automation
# Exits 0 if up-to-date, 1 if update available, 2 on error

set -euo pipefail

# Config — edit for self-hosted Forge instances
FORGE_BINARY="${FORGE_BINARY:-/usr/bin/forge}"
FORGE_API="${FORGE_API:-https://api.github.com}"
REPO="${REPO:-tailcallhq/forgecode}"
CURRENT_VERSION="${CURRENT_VERSION:-}"

# Telegram config (optional — set TG_* vars to enable alerts)
TG_BOT_TOKEN="${TG_BOT_TOKEN:-}"
TG_CHAT_ID="${TG_CHAT_ID:-}"

send_telegram() {
    [[ -z "${TG_BOT_TOKEN}" || -z "${TG_CHAT_ID}" ]] && return 0
    local msg="$1"
    curl -s -o /dev/null -w "%{http_code}" \
        "https://api.telegram.org/bot${TG_BOT_TOKEN}/sendMessage" \
        -d "chat_id=${TG_CHAT_ID}" \
        -d "text=${msg}" \
        -d "parse_mode=HTML"
}

get_current_version() {
    if [[ -x "$FORGE_BINARY" ]]; then
        # Try --version first (most reliable)
        local ver
        ver="$("$FORGE_BINARY" --version 2>/dev/null | head -1)" && [[ -n "$ver" ]] && echo "$ver" && return 0
        ver="$("$FORGE_BINARY" version 2>/dev/null | head -1)" && [[ -n "$ver" ]] && echo "$ver" && return 0
    fi
    # Fallback: parse from binary name or config
    return 1
}

get_latest_version() {
    local latest
    latest="$(curl -s --fail "${FORGE_API}/repos/${REPO}/releases/latest" \
        | python3 -c 'import json,sys; print(json.load(sys.stdin)["tag_name"])' 2>/dev/null)" \
        && echo "${latest#v}" && return 0
    return 1
}

main() {
    local current="${CURRENT_VERSION}"
    local latest

    # Get current installed version
    if [[ -z "$current" ]]; then
        current="$(get_current_version)" || current="unknown"
    fi

    # Get latest release version
    latest="$(get_latest_version)" || {
        echo "Error: could not fetch latest version from GitHub API" >&2
        send_telegram "⚠️ <b>Forge-Code</b>: could not reach GitHub API" >&2
        return 2
    }

    # Strip leading 'v' if present
    current="${current#v}"
    latest="${latest#v}"

    if [[ "$current" == "$latest" ]]; then
        echo "Up to date: ${current}"
        return 0
    fi

    # Update available
    echo "Update available: ${current} → ${latest}"
    send_telegram "📦 <b>Forge-Code update</b>: ${current} → <code>${latest}</code>" \
        " — run: <code>paru -Syu</code> to upgrade"
    return 1
}

main "$@"
