#!/usr/bin/env bash
# unsloth-updater.sh — scheduled updater for the Unsloth Studio ROCm/gfx90a stack.
#
# Checks with nvchecker (nvchecker.toml). The update is ATOMIC: if ANY module
# satisfies the update condition, the whole stack is reinstalled as one unit
# (unsloth library via the official installer + the newest torch/torchvision/
# torchaudio pins on the newest ROCm line). Any failure keeps the old state
# committed, so the next timer tick retries the whole thing.
#
# The llama.cpp/whisper.cpp/audio.cpp trees under ~/.unsloth are intentionally
# NOT updated here: their release tarballs do not match Studio's on-disk layout
# (build/bin overlay, top-level llama-server symlink, install-record json, and
# whisper's libggml libs hardlinked from the paired llama.cpp build). Wholesale
# swaps break the install -- Studio's own installer owns those components.
#
# State (oldver/newver json) lives in $XDG_STATE_HOME/unsloth-updater.
# oldver only advances after everything succeeded, so a failed run is retried
# on the next timer tick.
#
# Environment knobs:
#   UNSLOTH_UPDATER_DRY_RUN=1        check + print plan, change nothing
#   UNSLOTH_UPDATER_FORCE=1          first run applies immediately (default: baseline only)
#   UNSLOTH_UPDATER_CONFIG=<file>    alternate nvchecker config
#   UNSLOTH_UPDATER_WHL_INDEX=<url>  AMD wheel index base
set -u -o pipefail

: "${HOME:?HOME must be set}"

SHARE_DIR=/usr/share/unsloth-updater
LIBEXEC=/usr/lib/unsloth-updater
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/unsloth-updater"
UNSLOTH_DIR="${UNSLOTH_HOME:-$HOME/.unsloth}"
VENV_PY="$UNSLOTH_DIR/studio/unsloth_studio/bin/python"
NVCHKCFG="${UNSLOTH_UPDATER_CONFIG:-$SHARE_DIR/nvchecker.toml}"
WHL_INDEX="${UNSLOTH_UPDATER_WHL_INDEX:-https://stable.repo.amd.com/rocm/whl-next/}"
DRY_RUN="${UNSLOTH_UPDATER_DRY_RUN:-0}"

log() { printf '[%s] %s\n' "$(date '+%F %T')" "$*"; }
die() { log "ERROR: $*"; exit 1; }

mkdir -p "$STATE"
exec 9>"$STATE/updater.lock"
flock -n 9 || { log "another updater run is in progress, exiting"; exit 0; }

# ---------------------------------------------------------------- check phase
# nvchecker takes oldver/newver from the [__config__] table of its TOML, so
# generate a runtime config that points them into $STATE (unless the user's
# own config already defines [__config__]).
RUNCFG="$STATE/nvchecker-runtime.toml"
if grep -qE '^\[(__config__|"__config__")\]' "$NVCHKCFG"; then
    RUNCFG="$NVCHKCFG"
else
    {
        printf '[__config__]\noldver = "%s"\nnewver = "%s"\n\n' \
            "$STATE/oldver.json" "$STATE/newver.json"
        cat "$NVCHKCFG"
    } > "$RUNCFG"
fi

log "checking with nvchecker ($NVCHKCFG)"
nvchecker -c "$RUNCFG" || die "nvchecker failed"

mapfile -t CHANGED < <(python3 - "$STATE/oldver.json" "$STATE/newver.json" <<'PYEOF'
import json, os, sys

def load(path):
    if not os.path.exists(path):
        return {}
    with open(path) as f:
        d = json.load(f)
    if d.get("version") == 2:  # nvchecker v2 verfile wrapper
        d = d.get("data", {})
    out = {}
    for k, v in d.items():
        out[k] = v.get("version") if isinstance(v, dict) else v
    return out

old, new = load(sys.argv[1]), load(sys.argv[2])
for name in sorted(new):
    nv = new[name]
    ov = old.get(name)
    if nv and ov != nv:
        print(f"{name} {ov or '(none)'} -> {nv}")
PYEOF
)

if [[ ${#CHANGED[@]} -eq 0 ]]; then
    log "everything up to date"
    exit 0
fi
for c in "${CHANGED[@]}"; do log "update available: $c"; done

if [[ $DRY_RUN == 1 ]]; then
    log "dry run: nothing will be changed"
    exit 0
fi

# First run: record what upstream currently offers as the baseline instead of
# reinstalling everything. Delete oldver.json + set FORCE to re-apply anyway.
if [[ ! -f $STATE/oldver.json && ${UNSLOTH_UPDATER_FORCE:-0} != 1 ]]; then
    cp "$STATE/newver.json" "$STATE/oldver.json"
    log "first run: baseline recorded, nothing applied (set UNSLOTH_UPDATER_FORCE=1 to apply anyway)"
    exit 0
fi

# ------------------------------------------------------------- stack updates
update_stack() {
    log "re-running the Unsloth installer"
    export UNSLOTH_INSTALL_SYSTEMD=1
    export UNSLOTH_SKIP_AUTOSTART=1
    export UNSLOTH_INSTALL_NO_ROLLBACK=1
    curl -fsSL https://unsloth.ai/install.sh | sh || return 1

    [[ -x $VENV_PY || -f $VENV_PY ]] || { log "venv python not found: $VENV_PY"; return 1; }

    # Atomic: ANY module change reinstalls the whole stack, so pin and verify
    # torch unconditionally here -- not only when pytorch_rocm itself changed.
    local ROCM_VER TORCH_VER TV_VER TA_VER
    eval "$(python3 "$LIBEXEC/amd_pytorch.py" --eval)" \
        || { log "could not resolve AMD pins"; return 1; }
    log "installing torch pins: rocm=$ROCM_VER torch=$TORCH_VER torchvision=$TV_VER torchaudio=$TA_VER"
    "$VENV_PY" -m pip install --index-url "$WHL_INDEX" \
        "torch[device-gfx90a]==${TORCH_VER}" \
        "torchvision[device-gfx90a]==${TV_VER}" \
        "torchaudio==${TA_VER}" || return 1

    log "verifying torch sees the GPU"
    [[ $("$VENV_PY" -c "import torch; print(torch.cuda.is_available())" 2>&1) == True ]] || {
        log "torch.cuda.is_available() is not True after update"
        return 1
    }
    return 0
}

# ---------------------------------------------------------------- apply phase
FAILED=()

if [[ ${#CHANGED[@]} -gt 0 ]]; then
    log "one or more modules changed -- reinstalling the full stack atomically"
    update_stack || FAILED+=("stack")
fi

# ------------------------------------------------------------- commit results
if [[ ${#FAILED[@]} -eq 0 ]]; then
    cp "$STATE/newver.json" "$STATE/oldver.json"
    log "done, state committed to $STATE/oldver.json"
else
    log "FAILED components: ${FAILED[*]} — old versions kept in state, will retry next run"
    exit 1
fi
