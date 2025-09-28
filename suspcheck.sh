#!/bin/bash
# suspcheck.sh — checks PKGBUILD and GitHub info for suspicious developers/domains

PKGBUILD="$1"
DEEP_SCAN=${2:-0}  # set to 1 to clone repo and check commit emails

BLOCKED_LOC_FILE="/usr/local/etc/suspcheck-blocked-locations.txt"
DENYLIST_FILE="/usr/local/etc/suspcheck-denylist.txt"
BLOCKED_EMAIL_FILE="/usr/local/etc/suspcheck-blocked-domains.txt"

SESSION_FILE="/tmp/suspcheck_check_decision.$$"  # Temp file for session-wide decision

# --- Auto-generate index.json if empty ---
MODULAR_INDEX="/usr/local/etc/suscheck-data/index.json"
if [[ ! -s "$MODULAR_INDEX" ]]; then
    jq -n --argjson modules "$(ls suscheck-data/*.json | jq -R . | jq -s .)" '{modules: $modules}' > "$MODULAR_INDEX"
    echo "⚠️ Generated modular index.json dynamically."
fi


# --- Reuse previous session decision ---
if [[ -f "$SESSION_FILE" ]]; then
    DECISION=$(<"$SESSION_FILE")
    if [[ "$DECISION" != [yY] ]]; then
        echo "❌ Blocked by suspcheck (previous decision)"
        exit 1
    else
        echo "✅ Proceeding (previous decision)"
        exit 0
    fi
fi

# --- Load blocked locations ---
if [[ -f "$BLOCKED_LOC_FILE" ]]; then
    mapfile -t SUSP_LOCATIONS < "$BLOCKED_LOC_FILE"
else
    echo "⚠️ Blocked locations file not found: $BLOCKED_LOC_FILE"
    SUSP_LOCATIONS=()
fi

# --- Load blocked email domains ---
if [[ -f "$BLOCKED_EMAIL_FILE" ]]; then
    mapfile -t BLOCKED_EMAIL_DOMAINS < "$BLOCKED_EMAIL_FILE"
else
    BLOCKED_EMAIL_DOMAINS=(".ru" ".su")  # fallback
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

# --- 1. Check PKGBUILD for suspicious emails ---
ALL_EMAILS=$(grep -ioE "[[:alnum:]._%+-]+@[[:alnum:].-]+" "$PKGBUILD" || true)
SUSP_EMAILS=""
for email in $ALL_EMAILS; do
    for domain in "${BLOCKED_EMAIL_DOMAINS[@]}"; do
        [[ "$email" == *"$domain" ]] && SUSP_EMAILS+="$email "
    done
done

# --- 1b. Load modular country JSON structure (optional enhancement) ---
MODULAR_INDEX="/usr/local/etc/suscheck-data/index.json"
declare -A COUNTRY_CITIES COUNTRY_DOMAINS COUNTRY_MAINTAINERS COUNTRY_REASON

if [[ -f "$MODULAR_INDEX" ]]; then
    mapfile -t MODULE_FILES < <(jq -r '.modules[]' "$MODULAR_INDEX")
    for mod in "${MODULE_FILES[@]}"; do
        [[ ! -f "$mod" ]] && continue

        country=$(jq -r '.country' "$mod")
        COUNTRY_REASON[$country]=$(jq -r '.reason' "$mod")

        mapfile -t cities < <(jq -r '.cities[]?' "$mod")
        COUNTRY_CITIES[$country]="${cities[*]}"

        mapfile -t domains < <(jq -r '.domains[]?' "$mod")
        COUNTRY_DOMAINS[$country]="${domains[*]}"

        mapfile -t maintainers < <(jq -r '.maintainers[]?' "$mod")
        COUNTRY_MAINTAINERS[$country]="${maintainers[*]}"
    done
fi


# --- 2. Check PKGBUILD for suspicious URLs ---
SUSP_URLS=$(grep -ioE "https?://[[:alnum:]./-]+\.(ru|su|cn|by|kp)" "$PKGBUILD" || true)

# --- 3. Extract GitHub usernames from source URLs ---
GITHUB_USERS=$(grep -ioE "https?://github.com/([A-Za-z0-9_-]+)" "$PKGBUILD" \
    | sed -E 's|https?://github.com/||' | sed 's|/.*||')

# --- 3b. Check modular country structure ---
for country in "${!COUNTRY_DOMAINS[@]}"; do
    for domain in ${COUNTRY_DOMAINS[$country]}; do
        for email in $ALL_EMAILS; do
            [[ "$email" == *"$domain" ]] && echo "⚠️ Email $email matches $country — ${COUNTRY_REASON[$country]}"
        done
        for url in $SUSP_URLS; do
            [[ "$url" == *"$domain" ]] && echo "⚠️ URL $url matches $country — ${COUNTRY_REASON[$country]}"
        done
    done
done

for user in $GITHUB_USERS; do
    for country in "${!COUNTRY_MAINTAINERS[@]}"; do
        for maint in ${COUNTRY_MAINTAINERS[$country]}; do
            [[ "$user" == "$maint" ]] && echo "⚠️ GitHub user $user matches $country — ${COUNTRY_REASON[$country]}"
        done
    done
done


# --- 4. Check usernames against denylist & location ---
declare -A WARNINGS
for user in $GITHUB_USERS; do
    # denylist check
    for blocked in "${DENYLIST[@]}"; do
        [[ "$user" == "$blocked" ]] && WARNINGS["user_$user"]="Username $user is in denylist."
    done
    # location check via GitHub API
    LOCATION=$(curl -s "https://api.github.com/users/$user" | jq -r '.location // empty')
    for loc in "${SUSP_LOCATIONS[@]}"; do
        [[ "$LOCATION" == *"$loc"* ]] && WARNINGS["loc_$user"]="GitHub user $user location: $LOCATION"
    done
done

# Print warnings
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
            COMMIT_SUSP=$(git -C "$TMPDIR" log --pretty=format:'%ae' | grep -E '\.(ru|su|cn|by|kp)' || true)
            if [[ -n "$COMMIT_SUSP" ]]; then
                echo "⚠️  Repo $REPO_URL has suspicious commit emails:"
                echo "$COMMIT_SUSP"
                SUSP_EMAILS="$SUSP_EMAILS (commit emails)"
            fi
            rm -rf "$TMPDIR"
        fi
    done
fi

# --- 6. Prompt if anything suspicious found ---
if [[ -n "$SUSP_EMAILS$SUSP_URLS" || ${#WARNINGS[@]} -gt 0 ]]; then
    echo
    echo "🚨 Potentially suspicious maintainer/source detected:"
    [[ -n "$SUSP_EMAILS" ]] && echo "Emails: $SUSP_EMAILS"
    [[ -n "$SUSP_URLS" ]] && echo "URLs: $SUSP_URLS"
    echo
    read -p "Install/build package anyway? (y/N): " choice
    choice=${choice:-N}
    echo "$choice" > "$SESSION_FILE"
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
