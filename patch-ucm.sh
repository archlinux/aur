#!/usr/bin/env bash
# Patch sof-soundwire UCM for the PX13 codec layout. Idempotent.
# Triggered by /usr/share/libalpm/hooks/95-px13-audio-fix.hook whenever
# alsa-ucm-conf reinstalls the files, and once at package install time.
set -euo pipefail

SOF_FILE=/usr/share/alsa/ucm2/sof-soundwire/sof-soundwire.conf
RT721_FILE=/usr/share/alsa/ucm2/sof-soundwire/rt721.conf

if [[ ! -f $SOF_FILE ]]; then
    echo "px13-audio-fix: $SOF_FILE not found, alsa-ucm-conf missing?" >&2
    exit 0
fi

# Match the upstream regex exactly (rt1318(-1)?|cs35l56(-bridge)?) and
# append |tas2783(-1)?. If the upstream form changes, log a warning
# instead of crashing the transaction.
if ! grep -q 'tas2783' "$SOF_FILE"; then
    if grep -qF 'Regex "(rt1318(-1)?|cs35l56(-bridge)?)"' "$SOF_FILE"; then
        sed -i 's|Regex "(rt1318(-1)?\|cs35l56(-bridge)?)"|Regex "(rt1318(-1)?\|cs35l56(-bridge)?\|tas2783(-1)?)"|' "$SOF_FILE"
        echo "px13-audio-fix: patched $SOF_FILE for tas2783"
    else
        echo "px13-audio-fix: WARNING — upstream regex in $SOF_FILE has changed, manual patch needed" >&2
    fi
fi

if [[ -f $RT721_FILE ]] && grep -qE '^[[:space:]]*JackControl "(Headphone|Headset Mic) Jack"[[:space:]]*$' "$RT721_FILE"; then
    sed -i -E '/^[[:space:]]*JackControl "(Headphone|Headset Mic) Jack"[[:space:]]*$/d' "$RT721_FILE"
    echo "px13-audio-fix: patched $RT721_FILE to allow manual RT721 routing"
fi
