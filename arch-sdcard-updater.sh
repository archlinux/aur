#!/usr/bin/env bash
# arch-sdcard-updater — space-aware incremental updater for Arch on SD cards
# Updates packages one at a time with adaptive sort and per-package timeouts.

set -euo pipefail

# ── Argument parsing ────────────────────────────────────────────────────────────────────────────────

SKIP_HEAVY=false
OVERNIGHT_MODE=false
NO_PROTECTION=false
for arg in "$@"; do
    case "$arg" in
        --skip-heavy) SKIP_HEAVY=true ;;
        --overnight-mode) OVERNIGHT_MODE=true ;;
        --no-protection) NO_PROTECTION=true ;;
        *) echo "Unknown argument: $arg"; exit 1 ;;
    esac
done

# ── Config file ───────────────────────────────────────────────────────────────

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/arch-sdcard-updater"
CONFIG_FILE="$CONFIG_DIR/config"

if [[ ! -f "$CONFIG_FILE" ]]; then
    mkdir -p "$CONFIG_DIR"
    cat > "$CONFIG_FILE" << 'EOF'
# arch-sdcard-updater configuration
# All changes take effect on next run.

# Stop updating when free space drops below this (MB)
SPACE_THRESHOLD_MB=200

# Survival mode: if free_space < smallest_package * SURVIVAL_MARGIN,
# switch to largest-first sort to maximize space recovered per install.
# Otherwise smallest-first to maximize number of packages updated.
SURVIVAL_MARGIN=2

# Timeout for repo package installs (minutes). Repo packages only download
# and install pre-built binaries — 5 min is generous.
TIMEOUT_REPO_MIN=5

# Timeout for AUR package builds (minutes). AUR packages may compile from
# source. webkit2gtk, chromium etc. can take 1-2h on slow hardware.
TIMEOUT_AUR_MIN=120

# Skip AUR packages with installed size above this (MB). --skip-heavy flag.
HEAVY_THRESHOLD_MB=500
EOF
    echo "==> Config created at $CONFIG_FILE — edit to customize."
fi

# shellcheck source=/dev/null
source "$CONFIG_FILE"

# ── Backfill missing config keys ─────────────────────────────────────────────────────

if [[ -z "${HEAVY_THRESHOLD_MB+_}" ]]; then
    printf '\n# Skip heavy AUR packages with --skip-heavy\nHEAVY_THRESHOLD_MB=500\n' >> "$CONFIG_FILE"
    HEAVY_THRESHOLD_MB=500
fi

# ── SSH + tmux guard ──────────────────────────────────────────────────────────────

if [[ -n "${SSH_CONNECTION:-}" ]] && [[ -z "${TMUX:-}" ]] && [[ -z "${STY:-}" ]]; then
    if command -v tmux &>/dev/null; then
        echo "==> SSH session detected without tmux."
        echo "    Relaunching inside tmux session 'sdupdate'..."
        echo "    If disconnected, reconnect and run: tmux attach -t sdupdate"
        echo "    Caching sudo credentials..."
        sudo -v
        tmux new-session -d -s sdupdate "$0" "$@" 2>/dev/null || true
        echo "    Attached. If disconnected, run: tmux attach -t sdupdate"
        exec tmux attach -t sdupdate
    else
        echo "==> WARNING: SSH without tmux. Install for resilience: sudo pacman -S tmux"
        echo "==> Continuing unprotected..."
    fi
fi

# ── tmux session pause ──────────────────────────────────────────────────────────────


tmux_pause() {
    if [[ -n "${TMUX:-}" ]]; then
        echo ""
        read -rp "==> Press Enter to close tmux session..."
    fi
}
tmux_error() {
    echo ""
    echo "==> CRASH at line $1: $2"
    tmux_pause
}
trap 'tmux_error $LINENO "$BASH_COMMAND"' ERR
trap tmux_pause EXIT

# ── Logging setup ─────────────────────────────────────────────────────────────

LOG_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/arch-sdcard-updater"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
LOG_SUCCESS="$LOG_DIR/success-$TIMESTAMP.log"
LOG_SKIP="$LOG_DIR/skip-$TIMESTAMP.log"
LOG_FAIL="$LOG_DIR/fail-$TIMESTAMP.log"
LOG_ORPHAN="$LOG_DIR/orphaned.log"

mkdir -p "$LOG_DIR"

# Per-invocation output capture. pacman aborts a conflicted transaction before
# it starts, so /var/log/pacman.log only ever gets the "[PACMAN] Running ..."
# line — never the conflict text. That text is split across both streams:
#   stderr: error: failed to prepare transaction (could not satisfy dependencies)
#   stdout: :: installing systemd-libs (261.1-1) breaks dependency '...' required by systemd
# The blocker names are only on stdout, so both streams must be captured.
# Scoping to one invocation also keeps a conflict from one package from
# leaking into the verdict for every package after it.
OUTPUT_CAP="$LOG_DIR/.output-$$"
: > "$OUTPUT_CAP"

# Blocking package names parsed out of the last conflict — see parse_conflict_blockers
declare -a CONFLICT_BLOCKERS=()

# Packages already installed as part of a group retry; skipped when reached in queue
declare -A GROUP_DONE=()

# Packages that timed out — tracked for end-of-run advice
TIMED_OUT_PKGS=()
TIMED_OUT_TYPES=()

# ── Priority tiers ────────────────────────────────────────────────────────────

TIER1=(pacman glibc systemd systemd-libs filesystem)
TIER2=(linux linux-lts linux-zen linux-hardened mkinitcpio openssl gcc-libs libgcc)

# ── Helpers ───────────────────────────────────────────────────────────────────

log_success() { echo "$1" | tee -a "$LOG_SUCCESS"; }
log_skip()    { echo "$1" | tee -a "$LOG_SKIP";    }
log_fail()    { echo "$1" | tee -a "$LOG_FAIL";    }
log_orphan()  {
    if ! grep -qxF "$1" "$LOG_ORPHAN" 2>/dev/null; then
        echo "$1" >> "$LOG_ORPHAN"
    fi
}

count_lines() { [[ -f "$1" ]] && wc -l < "$1" || echo 0; }

free_mb() { df --output=avail -m / | tail -1 | tr -d ' '; }

check_space() {
    local free
    free=$(free_mb)
    if (( free < SPACE_THRESHOLD_MB )); then
        echo ""
        echo "==> STOPPING: free space ${free}MB below threshold ${SPACE_THRESHOLD_MB}MB"
        show_orphan_summary
        show_timeout_summary
        echo "==> Logs: $LOG_DIR"
        exit 0
    fi
}

is_orphan() { ! pacman -Si "$1" &>/dev/null && ! yay -Si "$1" &>/dev/null; }
is_aur()    { ! pacman -Si "$1" &>/dev/null; }

# ── Conflict parsing ──────────────────────────────────────────────────────────

CONFLICT_PATTERN='could not satisfy dependencies|breaks dependency|conflicting dependencies|are in conflict'

# Pull the blocking package names out of captured pacman output. Handles the
# three shapes pacman emits when a version-locked group is updated piecemeal:
#   :: installing gstreamer (1.26.0-1) breaks dependency 'gstreamer=1.24.10' required by gst-plugins-base-libs
#   :: removing x265 breaks dependency 'libx265.so' required by ffmpeg
#   :: gstreamer and gstreamer-git are in conflict
parse_conflict_blockers() {
    local f="$1"
    {
        sed -nE "s/.*required by ([A-Za-z0-9@._+-]+).*/\1/p"                     "$f"
        sed -nE "s/.*removing ([A-Za-z0-9@._+-]+) breaks dependency.*/\1/p"      "$f"
        sed -nE "s/.*installing ([A-Za-z0-9@._+-]+) .*breaks dependency.*/\1/p"  "$f"
        sed -nE "s/.*:: ([A-Za-z0-9@._+-]+) and ([A-Za-z0-9@._+-]+) are in conflict.*/\1\n\2/p" "$f"
    } | sed '/^$/d' | sort -u
}

# ── Timed installer ───────────────────────────────────────────────────────────

run_with_timeout() {
    local pkg="$1"
    local timeout_min="$2"
    local is_aur_pkg="$3"
    local is_heavy="${4:-false}"
    local timeout_sec=$(( timeout_min * 60 ))
    # Fresh capture per invocation so a previous package's conflict can't be
    # attributed to this one. AUR builds keep streaming output live (a 2h
    # compile shouldn't have its progress swallowed), so the capture stays
    # empty for them and group retry stays repo-only.
    : > "$OUTPUT_CAP"
    CONFLICT_BLOCKERS=()
    if [[ "$is_aur_pkg" == "true" ]]; then
        if [[ "$NO_PROTECTION" == "true" ]]; then
            nice -n 19 yay -S --noconfirm --needed \
                --answerdiff=None --answerclean=None \
                --removemake --cleanafter \
                "$pkg" &
        else
            local jobs mem_max
            if [[ "$OVERNIGHT_MODE" == "true" ]]; then
                jobs=$(( $(nproc) / 4 ))
                mem_max="25%"
                cpu_quota="25%"
            else
                jobs=$(( $(nproc) / 2 ))
                mem_max="50%"
                cpu_quota="50%"
            fi
            [[ $jobs -lt 1 ]] && jobs=1
            export MAKEFLAGS="-j${jobs}"
            if command -v systemd-run &>/dev/null; then
                nice -n 19 systemd-run --user --scope \
                    -p MemoryMax=${mem_max} \
                    -p CPUQuota=${cpu_quota} \
                    -- \
                    yay -S --noconfirm --needed \
                    --answerdiff=None --answerclean=None \
                    --removemake --cleanafter \
                    "$pkg" &
            else
                nice -n 19 yay -S --noconfirm --needed \
                    --answerdiff=None --answerclean=None \
                    --removemake --cleanafter \
                    "$pkg" &
            fi
        fi
    else
        sudo pacman -S --noconfirm --needed "$pkg" >"$OUTPUT_CAP" 2>&1 &
    fi

    local child_pid=$!
    local elapsed=0

    while kill -0 "$child_pid" 2>/dev/null; do
        sleep 10
        elapsed=$(( elapsed + 10 ))
        if (( elapsed >= timeout_sec )); then
            echo ""
            echo "    TIMEOUT: $pkg exceeded ${timeout_min}min — killing"
            kill "$child_pid" 2>/dev/null
            wait "$child_pid" 2>/dev/null || true
            return 2
        fi
    done

    wait "$child_pid"
    local rc=$?
    # Surface the captured output — it was redirected away from the terminal
    [[ -s "$OUTPUT_CAP" ]] && cat "$OUTPUT_CAP" >&2
    if grep -qE "$CONFLICT_PATTERN" "$OUTPUT_CAP" 2>/dev/null; then
        mapfile -t CONFLICT_BLOCKERS < <(parse_conflict_blockers "$OUTPUT_CAP" | grep -vxF "$pkg")
        return 3
    fi
    return $rc
}

# ── Group retry ───────────────────────────────────────────────────────────────

# Install a version-locked group in one transaction, under the repo timeout.
# Mirrors run_with_timeout's kill-on-timeout flow rather than reusing it, so the
# single-package path keeps its exact rc semantics.
run_group_with_timeout() {
    local timeout_sec=$(( TIMEOUT_REPO_MIN * 60 ))
    : > "$OUTPUT_CAP"
    sudo pacman -S --noconfirm --needed "$@" >"$OUTPUT_CAP" 2>&1 &
    local child_pid=$!
    local elapsed=0
    while kill -0 "$child_pid" 2>/dev/null; do
        sleep 10
        elapsed=$(( elapsed + 10 ))
        if (( elapsed >= timeout_sec )); then
            echo ""
            echo "    TIMEOUT: group exceeded ${TIMEOUT_REPO_MIN}min — killing"
            kill "$child_pid" 2>/dev/null
            wait "$child_pid" 2>/dev/null || true
            return 2
        fi
    done
    wait "$child_pid"
    local rc=$?
    [[ -s "$OUTPUT_CAP" ]] && cat "$OUTPUT_CAP" >&2
    return $rc
}

do_update() {
    local pkg="$1"
    if [[ -n "${GROUP_DONE[$pkg]+_}" ]]; then
        echo ""
        echo "==> Already updated in a group retry: $pkg — skipping"
        DONE_COUNT=$(( DONE_COUNT + 1 ))
        DONE_BYTES=$(( DONE_BYTES + ${QUEUE_SIZES[$pkg]:-0} ))
        print_progress
        return
    fi
    echo ""
    echo "==> [$( free_mb )MB free] Updating: $pkg"
    check_space

    if is_orphan "$pkg"; then
        echo "    ORPHAN: $pkg not found in repos or AUR — skipping"
        log_orphan "$pkg"
        DONE_COUNT=$(( DONE_COUNT + 1 ))
        DONE_BYTES=$(( DONE_BYTES + ${QUEUE_SIZES[$pkg]:-0} ))
        print_progress
        return
    fi

    if is_aur "$pkg"; then
        local rc heavy="false"
        (( ${QUEUE_SIZES[$pkg]:-0} > HEAVY_THRESHOLD_MB * 1024 * 1024 )) && heavy="true"
        [[ "$heavy" == "true" ]] && echo "    HEAVY: running at nice -n 19"
        run_with_timeout "$pkg" "$TIMEOUT_AUR_MIN" "true" "$heavy" && rc=$? || rc=$?
        if [[ $rc -eq 2 ]]; then
            log_fail "TIMEOUT [AUR] $pkg"
            TIMED_OUT_PKGS+=("$pkg")
            TIMED_OUT_TYPES+=("AUR")
        elif [[ $rc -eq 3 ]]; then
            echo "    DEP-CONFLICT: $pkg skipped — dependency version lock, will retry next run"
            log_skip "DEP-CONFLICT [AUR] $pkg"
        elif [[ $rc -eq 0 ]]; then
            log_success "OK [AUR] $pkg"
        else
            log_fail "ERR [AUR] $pkg"
        fi
    else
        local rc
        run_with_timeout "$pkg" "$TIMEOUT_REPO_MIN" "false" && rc=$? || rc=$?
        if [[ $rc -eq 2 ]]; then
            log_fail "TIMEOUT [repo] $pkg"
            TIMED_OUT_PKGS+=("$pkg")
            TIMED_OUT_TYPES+=("repo")
        elif [[ $rc -eq 3 ]]; then
            local -a group=("$pkg")
            local b
            for b in "${CONFLICT_BLOCKERS[@]}"; do
                # repo-only: an AUR blocker can't join a pacman transaction
                if pacman -Si "$b" &>/dev/null; then
                    group+=("$b")
                fi
            done
            if (( ${#group[@]} > 1 )); then
                echo "    DEP-CONFLICT: version lock — retrying as one transaction: ${group[*]}"
                local grc
                run_group_with_timeout "${group[@]}" && grc=$? || grc=$?
                if [[ $grc -eq 0 ]]; then
                    log_success "OK [repo-group] ${group[*]}"
                    for b in "${group[@]}"; do GROUP_DONE["$b"]=1; done
                elif [[ $grc -eq 2 ]]; then
                    log_fail "TIMEOUT [repo-group] ${group[*]}"
                    TIMED_OUT_PKGS+=("${group[*]}")
                    TIMED_OUT_TYPES+=("repo-group")
                else
                    log_fail "ERR [repo-group] ${group[*]}"
                fi
            else
                echo "    DEP-CONFLICT: $pkg skipped — no repo blockers parsed, will retry next run"
                log_skip "DEP-CONFLICT [repo] $pkg"
            fi
        elif [[ $rc -eq 0 ]]; then
            log_success "OK [repo] $pkg"
        else
            log_fail "ERR [repo] $pkg"
        fi
    fi
    DONE_COUNT=$(( DONE_COUNT + 1 ))
    DONE_BYTES=$(( DONE_BYTES + ${QUEUE_SIZES[$pkg]:-0} ))
    print_progress
}

# ── Progress bar ─────────────────────────────────────────────────────────────

print_progress() {
    local pct=0
    if (( TOTAL_BYTES > 0 )); then
        pct=$(( DONE_BYTES * 100 / TOTAL_BYTES ))
    elif (( TOTAL_COUNT > 0 )); then
        pct=$(( DONE_COUNT * 100 / TOTAL_COUNT ))
    fi
    local filled=$(( pct * 20 / 100 ))
    local empty=$(( 20 - filled ))
    local bar="" i
    for (( i=0; i<filled; i++ )); do bar+="█"; done
    for (( i=0; i<empty; i++ )); do bar+="░"; done
    local done_mb=$(( DONE_BYTES / 1024 / 1024 ))
    local total_mb=$(( TOTAL_BYTES / 1024 / 1024 ))
    local host="${HOSTNAME:-$(uname -n)}"
    echo ""
    echo "==> Progress: [${bar}] ${pct}% (${DONE_COUNT}/${TOTAL_COUNT} pkgs · ${done_mb}MB / ${total_mb}MB)"
    if [[ -n "${TMUX:-}" ]]; then
        echo "    ${host}  ·  Detach: Ctrl+B, D  ·  Reattach: tmux attach -t sdupdate"
    fi
}

# ── Orphan summary ────────────────────────────────────────────────────────────

show_orphan_summary() {
    if [[ ! -f "$LOG_ORPHAN" ]] || [[ ! -s "$LOG_ORPHAN" ]]; then return; fi

    declare -a SAFE=()
    declare -a BLOCKED=()

    while IFS= read -r pkg; do
        local required_by
        required_by=$(pacman -Qi "$pkg" 2>/dev/null | awk '/^Required By/{for(i=3;i<=NF;i++) printf "%s ", $i; print ""}' | xargs)
        if [[ "$required_by" == "None" ]] || [[ -z "$required_by" ]]; then
            SAFE+=("$pkg")
        else
            BLOCKED+=("$pkg : required by $required_by")
        fi
    done < "$LOG_ORPHAN"

    echo ""
    echo "━━━ Orphaned packages ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [[ ${#SAFE[@]} -gt 0 ]]; then
        echo "    Removing safe orphans (no dependents)..."
        for pkg in "${SAFE[@]}"; do
            echo "      removing $pkg"
            if sudo pacman -Rns --noconfirm "$pkg" 2>&1; then
                sed -i "/^${pkg}$/d" "$LOG_ORPHAN"
            else
                echo "      WARNING: could not remove $pkg — left in orphan list"
            fi
        done
    fi

    if [[ ${#BLOCKED[@]} -gt 0 ]]; then
        echo ""
        echo "    Blocked orphans (still required by other packages):"
        echo "    Update or remove their dependents first, then re-run."
        echo ""
        for entry in "${BLOCKED[@]}"; do
            echo "    • $entry"
        done
        echo ""
        echo "    To investigate:          pacman -Qi <package-name>"
        echo "    To force-remove (risky): sudo pacman -Rns <package-name>"
    fi

    [[ -s "$LOG_ORPHAN" ]] || rm -f "$LOG_ORPHAN"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# ── Timeout summary ───────────────────────────────────────────────────────────

show_timeout_summary() {
    if [[ ${#TIMED_OUT_PKGS[@]} -eq 0 ]]; then return; fi

    echo ""
    echo "━━━ Timed-out packages ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "    These packages exceeded their timeout and were skipped."
    echo "    Run them alone when you have time:"
    echo ""
    for i in "${!TIMED_OUT_PKGS[@]}"; do
        local pkg="${TIMED_OUT_PKGS[$i]}"
        local type="${TIMED_OUT_TYPES[$i]}"
        if [[ "$type" == "AUR" ]]; then
            echo "      yay -S $pkg"
        else
            echo "      sudo pacman -S $pkg"
        fi
    done
    echo ""
    echo "    To increase timeout, edit $CONFIG_FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# ── Sync databases ───────────────────────────────────────────────────────────

echo "==> Syncing package databases..."
sudo pacman -Syy --noconfirm

# ── Keyring refresh (only if archlinux-keyring has an update) ────────────────

echo "==> Checking keyring..."
if pacman -Qu archlinux-keyring 2>/dev/null | grep -q archlinux-keyring; then
    echo "==> Keyring update available — refreshing..."
    sudo pacman -S --noconfirm archlinux-keyring
    sudo pacman-key --populate archlinux
else
    echo "==> Keyring up to date — skipping."
fi
echo "==> Collecting updatable packages..."
mapfile -t UPDATABLE < <({ pacman -Qu 2>/dev/null || true; yay -Qua --aur 2>/dev/null || true; } | awk '{print $1}' | sort -u)

if [[ ${#UPDATABLE[@]} -eq 0 ]]; then
    echo "==> Nothing to update."
    show_orphan_summary
    exit 0
fi

echo "==> ${#UPDATABLE[@]} package(s) have updates."

declare -A UPDATABLE_SET
for p in "${UPDATABLE[@]}"; do UPDATABLE_SET["$p"]=1; done

# ── Build queue: repo first (smallest to largest), then AUR (smallest to largest)
# Uses expac local db for sizes — covers both repo and AUR installed packages

UPDATABLE_LIST=" ${!UPDATABLE_SET[@]} "

# Get sizes for all updatable packages
SIZED_DATA=$(expac -Q '%m	%n' 2>/dev/null     | awk -v pkgs="$UPDATABLE_LIST" '{if (index(pkgs, " "$2" ")) print $1, $2}')

# Adaptive sort: survival mode if free space < smallest package * SURVIVAL_MARGIN
smallest_bytes=$(echo "$SIZED_DATA" | awk 'BEGIN{m=99999999999} $1+0>0 && $1+0<m {m=$1+0} END{print m+0}')
free_bytes=$(( $(free_mb) * 1024 * 1024 ))
survival_threshold=$(( smallest_bytes * SURVIVAL_MARGIN ))

if (( smallest_bytes > 0 && free_bytes < survival_threshold )); then
    SORT_FLAG="-rn"
    echo "==> SURVIVAL MODE: free space below ${SURVIVAL_MARGIN}x smallest package — sorting largest-first"
else
    SORT_FLAG="-n"
    echo "==> Coverage mode: sorting smallest-first for maximum package count"
fi

declare -a QUEUE=()
declare -A QUEUED=()

# Tier 1 first
for pkg in "${TIER1[@]}"; do
    if [[ -n "${UPDATABLE_SET[$pkg]+_}" ]]; then
        QUEUE+=("$pkg"); QUEUED["$pkg"]=1
    fi
done

# Tier 2 next
for pkg in "${TIER2[@]}"; do
    if [[ -n "${UPDATABLE_SET[$pkg]+_}" ]] && [[ -z "${QUEUED[$pkg]+_}" ]]; then
        QUEUE+=("$pkg"); QUEUED["$pkg"]=1
    fi
done

# Repo packages: smallest first, skip already queued
while IFS= read -r pkg; do
    if [[ -n "${UPDATABLE_SET[$pkg]+_}" ]] && [[ -z "${QUEUED[$pkg]+_}" ]] && pacman -Si "$pkg" &>/dev/null; then
        QUEUE+=("$pkg"); QUEUED["$pkg"]=1
    fi
done < <(echo "$SIZED_DATA" | sort $SORT_FLAG | awk '{print $2}')

# AUR packages: binary first, then source-compiled, each sorted by size
# Detect source vs binary by presence of build() in AUR PKGBUILD
declare -a AUR_BINARY=() AUR_SOURCE=() AUR_BINARY_SIZES=() AUR_SOURCE_SIZES=()
while IFS= read -r line; do
    size=$(awk '{print $1}' <<< "$line")
    pkg=$(awk '{print $2}' <<< "$line")
    if [[ -n "${UPDATABLE_SET[$pkg]+_}" ]] && [[ -z "${QUEUED[$pkg]+_}" ]]; then
        if [[ "$SKIP_HEAVY" == "true" ]] && (( HEAVY_THRESHOLD_MB > 0 )) \
           && (( size > HEAVY_THRESHOLD_MB * 1024 * 1024 )); then
            echo "    SKIP-HEAVY: $pkg ($(( size / 1024 / 1024 ))MB) -- run 'yay -S $pkg' separately"
            log_skip "HEAVY $pkg"
            QUEUED["$pkg"]=1
            continue
        fi
        echo "    Checking $pkg (binary or source?)..."
        has_build=$(curl -sf "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkg}" \
            | grep -c "^build()" || true)
        if (( has_build > 0 )); then
            AUR_SOURCE+=("$pkg"); AUR_SOURCE_SIZES+=("$size")
        else
            AUR_BINARY+=("$pkg"); AUR_BINARY_SIZES+=("$size")
        fi
        QUEUED["$pkg"]=1
    fi
done < <(echo "$SIZED_DATA" | sort $SORT_FLAG)

# Binary AUR first (already size-sorted), then source-compiled
for pkg in "${AUR_BINARY[@]}"; do QUEUE+=("$pkg"); done
for pkg in "${AUR_SOURCE[@]}"; do QUEUE+=("$pkg"); done

# ── Progress tracking ────────────────────────────────────────────────────────

declare -A QUEUE_SIZES=()
TOTAL_BYTES=0
for pkg in "${QUEUE[@]}"; do
    sz=$(echo "$SIZED_DATA" | awk -v p="$pkg" '$2==p {print $1; exit}')
    sz=${sz:-0}
    QUEUE_SIZES["$pkg"]=$sz
    TOTAL_BYTES=$(( TOTAL_BYTES + sz ))
done
DONE_BYTES=0
DONE_COUNT=0
TOTAL_COUNT=${#QUEUE[@]}

# ── Run the queue ─────────────────────────────────────────────────────────────

echo ""
echo "==> Update queue (${#QUEUE[@]} packages: repo first, then AUR, smallest-first within each):"
printf '    %s\n' "${QUEUE[@]}"
echo ""

for pkg in "${QUEUE[@]}"; do
    do_update "$pkg"
done

# ── Summary ───────────────────────────────────────────────────────────────────

echo ""
echo "==> Done. Summary:"
echo "    Success : $(count_lines "$LOG_SUCCESS")"
echo "    Skipped : $(count_lines "$LOG_SKIP")"
echo "    Failed  : $(count_lines "$LOG_FAIL")"
echo "    Free now: $( free_mb )MB"
echo "    Logs    : $LOG_DIR"

show_orphan_summary
show_timeout_summary
