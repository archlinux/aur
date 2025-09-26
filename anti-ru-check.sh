#!/bin/bash
# ru-check.sh — checks PKGBUILD and GitHub info for Russian developers

PKGBUILD="$1"
DEEP_SCAN=${2:-0}  # set to 1 to clone repo and check commit emails

BLOCKED_LOC_FILE="/usr/local/etc/ru-blocked-locations.txt"
DENYLIST_FILE="/usr/local/etc/ru-denylist.txt"
BLOCKED_EMAIL_FILE="/usr/local/etc/ru-blocked-domains.txt"

SESSION_FILE="/tmp/ru_check_decision.$$"  # Temp file for session-wide decision

# --- Reuse previous session decision ---
if [[ -f "$SESSION_FILE" ]]; then
    DECISION=$(<"$SESSION_FILE")
    if [[ "$DECISION" != [yY] ]]; then
        echo "❌ Blocked by ru-check (previous decision)"
        exit 1
    else
        echo "✅ Proceeding (previous decision)"
        exit 0
    fi
fi

# --- Load blocked locations ---
if [[ -f "$BLOCKED_LOC_FILE" ]]; then
    mapfile -t RU_LOCATIONS < "$BLOCKED_LOC_FILE"
else
    echo "⚠️ Blocked locations file not found: $BLOCKED_LOC_FILE"
    RU_LOCATIONS=()
fi

# --- Load blocked email domains ---
if [[ -f "$BLOCKED_EMAIL_FILE" ]]; then
    mapfile -t BLOCKED_EMAIL_DOMAINS < "$BLOCKED_EMAIL_FILE"
else
    BLOCKED_EMAIL_DOMAINS=(".ru")  # fallback
fi

# --- Load denylist usernames ---
if [[ -f "$DENYLIST_FILE" ]]; then
    mapfile -t DENYLIST < "$DENYLIST_FILE"
else
    echo "⚠️ Denylist file not found: $DENYLIST_FILE"
    DENYLIST=()
fi

# --- Check PKGBUILD existence ---
if [[ ! -f "$PKGBUILD" ]]; then
    echo "❌ PKGBUILD not found: $PKGBUILD"
    exit 0
fi

# --- 1. Check PKGBUILD for .ru emails ---
RU_EMAILS=$(grep -ioE "[[:alnum:]._%+-]+@[[:alnum:].-]+" "$PKGBUILD" || true)
SUSPICIOUS_EMAILS=""
for email in $RU_EMAILS; do
    for domain in "${BLOCKED_EMAIL_DOMAINS[@]}"; do
        [[ "$email" == *"$domain" ]] && SUSPICIOUS_EMAILS+="$email "
    done
done
RU_EMAILS="$SUSPICIOUS_EMAILS"

# --- 2. Check PKGBUILD for .ru URLs ---
RU_URLS=$(grep -ioE "https?://[[:alnum:]./-]+\.ru" "$PKGBUILD" || true)

# --- 3. Extract GitHub usernames from source URLs ---
GITHUB_USERS=$(grep -ioE "https?://github.com/([A-Za-z0-9_-]+)" "$PKGBUILD" | sed -E 's|https?://github.com/||' | sed 's|/.*||')

# --- 4. Check usernames against denylist & location ---
declare -A WARNINGS
for user in $GITHUB_USERS; do
    # denylist check
    for blocked in "${DENYLIST[@]}"; do
        [[ "$user" == "$blocked" ]] && WARNINGS["user_$user"]="Username $user is in denylist."
    done
    # location check via GitHub API
    LOCATION=$(curl -s "https://api.github.com/users/$user" | jq -r '.location // empty')
    for ru in "${RU_LOCATIONS[@]}"; do
        [[ "$LOCATION" == *"$ru"* ]] && WARNINGS["loc_$user"]="GitHub user $user location: $LOCATION"
    done
done

# Print each warning once
for w in "${WARNINGS[@]}"; do
    echo "⚠️  $w"
done

# --- 5. Optional deep scan: git commit emails ---
if [[ "$DEEP_SCAN" -eq 1 ]]; then
    for user in $GITHUB_USERS; do
        REPO_URL=$(grep -ioE "https?://github.com/$user/[A-Za-z0-9_.-]+.git" "$PKGBUILD" | head -n1)
        if [[ -n "$REPO_URL" ]]; then
            TMPDIR=$(mktemp -d)
            git clone --depth 50 "$REPO_URL" "$TMPDIR" &>/dev/null
            COMMIT_RU=$(git -C "$TMPDIR" log --pretty=format:'%ae' | grep '\.ru' || true)
            if [[ -n "$COMMIT_RU" ]]; then
                echo "⚠️  Repo $REPO_URL has .ru commit emails:"
                echo "$COMMIT_RU"
                RU_EMAILS="$RU_EMAILS (commit emails)"
            fi
            rm -rf "$TMPDIR"
        fi
    done
fi

# --- 6. Prompt if anything suspicious found ---
if [[ -n "$RU_EMAILS$RU_URLS" ]]; then
    echo
    echo "🚨 Potential Russian maintainer/source detected:"
    [[ -n "$RU_EMAILS" ]] && echo "Emails / info: $RU_EMAILS"
    [[ -n "$RU_URLS" ]] && echo "URLs: $RU_URLS"
    echo
    read -p "Install/build package anyway? (y/N): " choice
    choice=${choice:-N}
    echo "$choice" > "$SESSION_FILE"   # Save decision for the rest of this build session
    if [[ "$choice" != [yY] ]]; then
        echo "❌ Aborting build."
        exit 1
    else
        echo "✅ Proceeding..."
        exit 0
    fi
fi

# --- 7. If nothing suspicious, proceed ---
exit 0
