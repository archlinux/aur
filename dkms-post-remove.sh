#!/usr/bin/env bash
# DKMS POST_REMOVE hook. Run by dkms as: dkms-post-remove.sh <kernelver> <arch>
#
# Putting btusb/btmtk back is this hook's job rather than DKMS's, because
# DKMS restores the archived in-tree originals only for the modules the
# dkms.conf being removed declares. dkms.conf declares btusb and btmtk only
# when the Bluetooth build is on, so removing the package after the opt-in
# was switched off (or after a kernel crossed 7.1 on its own) leaves the
# archived kernel copies in DKMS's original_module directory and the
# package's own copies orphaned under updates/dkms, still winning over the
# in-tree ones (GH #114). Declaring the modules unconditionally is not an
# option, because DKMS then looks for modules that were never built (GH #85).
#
# DKMS records each archived file's original path in a <name>.origin sidecar,
# which is all this needs. When the opt-in is still set DKMS has already
# restored them and removed the sidecars, so the loop finds nothing.
#
# DKMS_TREE and MODULES_ROOT exist so the hook can be tested against a
# scratch tree; leave them unset for real use.

kver=${1:-}
arch=${2:-}
[[ -n $kver && -n $arch ]] || exit 0

dkms_tree=${DKMS_TREE:-/var/lib/dkms}
mods_root=${MODULES_ROOT:-/lib/modules}
backup="$dkms_tree/mediatek-mt7927/original_module/$kver/$arch"
[[ -d $backup ]] || exit 0

# DKMS drops this symlink when it removes the version that was active for the
# kernel. Still being there means a different version is active, and its
# modules (and the archive they rely on) must not be touched.
[[ -L $dkms_tree/mediatek-mt7927/kernel-$kver-$arch ]] && exit 0

for origin in "$backup"/btusb.*.origin "$backup"/btmtk.*.origin; do
    [[ -f $origin ]] || continue
    archived=${origin%.origin}
    [[ -f $archived ]] || continue

    dest=$(head -n 1 "$origin")
    case $dest in
    "$mods_root/$kver/"* | "/usr/lib/modules/$kver/"*) ;;
    *)
        echo "mediatek-mt7927: not restoring $archived, unexpected origin '$dest'" >&2
        continue
        ;;
    esac

    mkdir -p "${dest%/*}" || continue
    mv -f "$archived" "$dest" || continue
    rm -f "$origin"
    echo "mediatek-mt7927: restored in-tree ${dest##*/}"

    # Only now is it known that this package installed a copy of its own
    # (it archived the original), so only now is removing one safe.
    name=${archived##*/}
    rm -f "$mods_root/$kver/updates/dkms/${name%%.*}".ko*
done

exit 0
