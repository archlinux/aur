#!/usr/bin/env bash
# Re-sync from CachyOS upstream linux-cachyos/{PKGBUILD,config}, then
# re-apply the px13 customization on top. Called from ~/distsystem/aur/update-all.sh.
# Argument: new version reported by nvchecker (e.g. "7.0.6-1") — informational.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

new_ver="${1:?usage: apply.sh <ver>}"

# 1. Pull fresh upstream PKGBUILD + config
gh api 'repos/CachyOS/linux-cachyos/contents/linux-cachyos/PKGBUILD?ref=master' \
    --jq '.content' | base64 -d > PKGBUILD.new
gh api 'repos/CachyOS/linux-cachyos/contents/linux-cachyos/config?ref=master' \
    --jq '.content' | base64 -d > config.new

# 2. Force uniform pkgsuffix → cachyos-px13 across all 3 LTO/GCC branches.
# Validate we hit 3 _pkgsuffix lines, otherwise upstream changed shape — abort.
n=$(grep -cE '^\s*_pkgsuffix=cachyos[a-z0-9-]*$' PKGBUILD.new)
if [[ $n -ne 3 ]]; then
    echo "apply.sh: expected 3 _pkgsuffix lines in upstream PKGBUILD, got $n" >&2
    echo "          upstream changed format — update apply.sh sed pattern" >&2
    rm -f PKGBUILD.new config.new
    exit 1
fi
sed -i -E 's/^(\s*_pkgsuffix=)cachyos[a-z0-9-]*$/\1cachyos-px13/' PKGBUILD.new

# 3. Append px13 customization block (kept in lockstep with the head version)
cat >> PKGBUILD.new <<'CUSTOM'

# ============================================================================
# PX13 fork customization — appended to keep upstream diff minimal so future
# CachyOS bumps rebase cleanly. Do not edit lines above this marker.
# ============================================================================

pkgdesc="${pkgdesc} + TAS2783 codec patches for ASUS ProArt PX13 (HN7306EA)"

# nealstar's 16 codec patches from CachyOS issue 737
# https://github.com/CachyOS/linux-cachyos/issues/737#issuecomment-2832947040
source+=(
    0001-ALSA-tas2783-sdw-add-Playback-to-volume-control.patch
    0002-Names-to-match-snd_soc_dai_driver-playback-capturest.patch
    0003-removed-unused-fields.patch
    0004-SOC_SINGLE_RANGE_TLV-uses-snd_soc_get_volsw-snd_soc_.patch
    0005-dev_set_drvdata-already-called-intas_sdw_probe.patch
    0006-refactor-setting-sa_func_data.patch
    0007-check-AF01-for-init-data.patch
    0008-setup-ports.patch
    0009-Already-set-by-SOC_SINGLE_RANGE_TLV-Speaker-Playback.patch
    0010-control-to-set-channel.patch
    0011-mute-unmute-using-SND_SOC_DAPM_SWITCH.patch
    0012-use-SND_SOC_DAPM_REG-to-power-on-off.patch
    0013-reattach-after-resume.patch
    0014-defer-check.patch
    0015-to-help-alsa-find-them.patch
    0016-cleanup-controls.patch
    0017-ASoC-rt721-sdca-enable-jack-detect-irq-on-AMD-ACP70.patch
)
b2sums+=(
    SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
)
CUSTOM

# 4. Diff against existing — no-op if nothing actually changed
if cmp -s PKGBUILD PKGBUILD.new && cmp -s config config.new; then
    rm PKGBUILD.new config.new
    echo "up-to-date: $(aur_pkgbuild_var pkgver) (no upstream changes)"
    exit 0
fi

mv PKGBUILD.new PKGBUILD
mv config.new config
sed -i -E 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
makepkg --printsrcinfo > .SRCINFO
echo "synced $(basename "$PWD") from CachyOS upstream -> $(aur_pkgbuild_var pkgver)"
