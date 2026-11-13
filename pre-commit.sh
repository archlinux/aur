#!/usr/bin/env bash
# AUR pre-commit hook: from the *staged* PKGBUILD (and staged tree), regenerate .SRCINFO
# (`makepkg --printsrcinfo`) and lint it (`namcap PKGBUILD`, errors block)
# inside a rootless Podman Arch container - never on the host.
# Canonical copy: ~/.config/opencode/skills/aur-srcinfo-podman-hook/pre-commit
set -euo pipefail

git diff --cached --name-only --diff-filter=ACM | grep -qx 'PKGBUILD' || exit 0

root=$(git rev-parse --show-toplevel)
base=${AUR_HOOK_BASE_IMAGE:-docker.io/library/archlinux:base}
image=localhost/aur-srcinfo-hook:1
command -v podman >/dev/null || { echo "aur hook: podman not found" >&2; exit 1; }

if ! podman image inspect "$image" >/dev/null 2>&1; then
    echo ">>> building $image (once)..." >&2
    printf 'FROM %s\nRUN pacman -Syu --noconfirm --needed namcap && pacman -Scc --noconfirm\n' "$base" |
        podman build --memory=1g --memory-swap=1g --cpu-period=100000 --cpu-quota=200000 -t "$image" -f - >&2
fi

work=$(mktemp -d "${XDG_RUNTIME_DIR:-$root/.git}/aur-hook.XXXXXX")
trap 'rm -rf "$work"' EXIT
mkdir "$work/out"
# the whole staged tree: PKGBUILD plus its install=/source= files, as committed
git -C "$root" checkout-index -a --prefix="$work/pkg/"

echo ">>> PKGBUILD staged - .SRCINFO + namcap in Podman ($image)..." >&2
podman run --rm --network=none \
    --memory=512m --memory-swap=512m --pids-limit=64 --cpus=1 \
    --userns=keep-id --user "$(id -u):$(id -g)" \
    --read-only --tmpfs /tmp:rw,size=64m -e HOME=/tmp \
    -e BUILDDIR=/tmp/build -e SRCDEST=/tmp/src -e PKGDEST=/tmp/pkg \
    -e SRCPKGDEST=/tmp/srcpkg -e LOGDEST=/tmp/log \
    --security-opt=no-new-privileges --cap-drop=all \
    -v "$work/pkg:/pkg:ro" -v "$work/out:/out" -w /pkg \
    "$image" sh -c 'makepkg --printsrcinfo > /out/SRCINFO && namcap PKGBUILD > /out/namcap'

test -s "$work/out/SRCINFO" || { echo "aur hook: empty .SRCINFO" >&2; exit 1; }
if [ -s "$work/out/namcap" ]; then
    cat "$work/out/namcap" >&2
    if grep -Eq '^PKGBUILD( \([^)]*\))? E:' "$work/out/namcap"; then
        echo "aur hook: namcap reported errors; fix them before committing." >&2
        exit 1
    fi
fi
cp "$work/out/SRCINFO" "$root/.SRCINFO"
git -C "$root" add .SRCINFO
