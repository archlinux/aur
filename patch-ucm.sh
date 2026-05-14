#!/usr/bin/env bash
# Append tas2783 to the speaker-codec regex inside sof-soundwire.conf so the
# UCM machine config picks up our tas2783.conf drop-in. Idempotent.
# Triggered by /usr/share/libalpm/hooks/95-px13-audio-fix.hook whenever
# alsa-ucm-conf reinstalls the file, and once at package install time.
set -euo pipefail

FILE=/usr/share/alsa/ucm2/sof-soundwire/sof-soundwire.conf

if [[ ! -f $FILE ]]; then
    echo "px13-audio-fix: $FILE not found, alsa-ucm-conf missing?" >&2
    exit 0
fi

if grep -q 'tas2783' "$FILE"; then
    exit 0
fi

# Match the upstream regex exactly (rt1318(-1)?|cs35l56(-bridge)?) and
# append |tas2783(-1)?. If the upstream form changes, log a warning
# instead of crashing the transaction.
if grep -qF 'Regex "(rt1318(-1)?|cs35l56(-bridge)?)"' "$FILE"; then
    sed -i 's|Regex "(rt1318(-1)?\|cs35l56(-bridge)?)"|Regex "(rt1318(-1)?\|cs35l56(-bridge)?\|tas2783(-1)?)"|' "$FILE"
    echo "px13-audio-fix: patched $FILE for tas2783"
else
    echo "px13-audio-fix: WARNING — upstream regex in $FILE has changed, manual patch needed" >&2
fi
