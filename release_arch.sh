#!/usr/bin/env bash
# Cut and install an Arch release of laptop-livecam.
#
# This exists because the 7.0.7 build was done by hand -- sed the pkgver,
# updpkgsums, makepkg, pacman -U -- which is the same untracked process the
# .deb side was criticised for, one package manager over. A release path
# nobody can re-run is not a release path.
#
# Usage: ./release_arch.sh <version>       e.g. ./release_arch.sh 7.0.9
#
# The version must already be tagged and PUSHED in the source repo, because
# the PKGBUILD sources the GitHub tarball for that tag. Tagging is a source
# repo decision and deliberately not done here.
set -euo pipefail

VER="${1:-}"
[ -n "$VER" ] || { echo "usage: $0 <version>" >&2; exit 1; }
SRC="${SRC_REPO:-$HOME/Projects/hls-livecam-server}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE"

say() { printf '\n== %s ==\n' "$*"; }
die() { printf '\nFAILED: %s\n' "$*" >&2; exit 1; }

# --- 1. The tag must exist upstream, not just locally -----------------
say "Checking v$VER is published"
git -C "$SRC" rev-parse -q --verify "refs/tags/v$VER" >/dev/null \
    || die "v$VER is not tagged in $SRC"
# Captured rather than piped into `grep -q .`, which exits on the first line
# and can leave git writing into a closed pipe -- under pipefail that is a
# 141 for a tag that exists.
REMOTE_TAG="$(git -C "$SRC" ls-remote --tags origin "refs/tags/v$VER")"
[ -n "$REMOTE_TAG" ] \
    || die "v$VER is not pushed to origin -- makepkg fetches the GitHub tarball for it"
COMMIT="$(git -C "$SRC" rev-parse --short "v$VER^{commit}")"
echo "v$VER -> $COMMIT"

# The source repo's own declared version has to agree, or the package will
# install files that announce a different release than the package does.
# This is the 7.0.8 failure in its other form: two artifacts, one number.
DECLARED="$(git -C "$SRC" show "v$VER:pkg/usr/share/hls-livecam-server/VERSION" | tr -d '[:space:]')"
[ "$DECLARED" = "$VER" ] \
    || die "v$VER ships VERSION=$DECLARED -- the tag and the file disagree"

# --- 2. PAYLOAD DIFF, which is the point of this script ---------------
# The PKGBUILD enumerates every installed file by hand against a tree that
# keeps growing, and has fallen short three times: cv_persist/cv_occupancy,
# vendor/hls.min.js, then hls-livecam-suite + hls-livecam.target +
# home.html. Each was invisible because the .deb packages pkg/ wholesale
# and only Arch was short. Reading the list is what missed them twice;
# diffing is what found them. So the diff runs on every release.
#
# Files legitimately absent from the Arch payload are listed here WITH a
# reason. Anything else that appears is a hard stop, not a warning: a new
# file nobody decided about is exactly how the last three got lost.
say "Diffing the tree against the PKGBUILD's install list"
mapfile -t TREE < <(git -C "$SRC" ls-tree -r --name-only "v$VER" -- pkg \
                    | grep -v '__pycache__')
mapfile -t LISTED < <(grep -oE 'pkg/[A-Za-z0-9_./-]+' PKGBUILD | sort -u)

is_listed()  { local f="$1"; local l; for l in "${LISTED[@]}"; do [ "$l" = "$f" ] && return 0; done; return 1; }
is_excused() {
    case "$1" in
        # Debian-only packaging metadata; pacman has install= instead.
        pkg/DEBIAN/*) return 0 ;;
        # The Debian variants of files Arch installs from a *-arch twin.
        pkg/usr/local/bin/hls-livecam-setup) return 0 ;;
        pkg/usr/share/hls-livecam-server/hls-livecam-setup) return 0 ;;
        pkg/etc/systemd/system/broadcast-api.service) return 0 ;;
        # Web root is populated by hls-livecam-setup at configure time, from
        # usr/share, so that @HOSTNAME@ is substituted per node. Installing a
        # pre-baked copy would overwrite it with the wrong hostname.
        pkg/var/www/*) return 0 ;;
        # Vendored source for a SIBLING project. broadcast-api reads
        # cambrian's state out of /dev/shm as a one-way read and imports
        # nothing from here, so shipping it would be dead weight.
        pkg/usr/share/hls-livecam-server/vendor/cambrian/*) return 0 ;;
        # Vendored pyfakewebcam, which exists for Debian only: Debian and
        # Ubuntu do not package it, so the .deb carries this copy instead of
        # pip-installing it as root at install time. Arch declares
        # python-pyfakewebcam as a dependency and broadcast-api prefers the
        # distro copy, so the fallback never fires here and shipping it would
        # be dead weight. If that dependency ever leaves the repos, package
        # these instead of excusing them.
        pkg/usr/share/hls-livecam-server/vendor/pyfakewebcam/*) return 0 ;;
        pkg/usr/share/hls-livecam-server/vendor/README.md) return 0 ;;
        # The timer has no .service in the tree -- systemd would default to
        # livecam-sync.service, which pkg/ does not contain. Packaging the
        # timer alone would ship a unit that cannot fire. Tracked as a gap
        # in the source repo, not papered over here.
        pkg/etc/systemd/system/livecam-sync.timer) return 0 ;;
        # Referenced by nothing in pkg/ or hosts/. Shipping scripts no
        # installed thing calls is how payloads grow unexamined.
        pkg/usr/local/lib/livecam-tools/*) return 0 ;;
    esac
    return 1
}

MISSING=()
for f in "${TREE[@]}"; do
    is_listed "$f" && continue
    is_excused "$f" && continue
    MISSING+=("$f")
done
if [ "${#MISSING[@]}" -gt 0 ]; then
    printf '  not installed and not excused: %s\n' "${MISSING[@]}"
    die "${#MISSING[@]} file(s) in v$VER are neither packaged nor excused. Add an install line, or excuse it with a reason in is_excused()."
fi
echo "  every file in pkg/ is either packaged or excused with a reason"

# --- 3. Build ---------------------------------------------------------
say "Building $VER"
sed -i "s/^pkgver=.*/pkgver=$VER/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
grep -q "pkgver = $VER" .SRCINFO || die ".SRCINFO did not pick up $VER"
makepkg -f --noconfirm
PKG="laptop-livecam-$VER-1-any.pkg.tar.zst"
[ -f "$PKG" ] || die "expected $PKG, not found"

# What is IN the package, checked against the tag rather than trusted.
#
# The listing is taken ONCE into a variable rather than piped to `grep -q`
# per file. Under `set -o pipefail`, grep -q exits on its first match, tar
# gets SIGPIPE, and the pipeline reports tar's death (141) even though the
# match succeeded -- so the first version of this check failed on a package
# that was correct. Cheaper this way too: one decompression, not four.
PKG_FILES="$(tar --use-compress-program=unzstd -tf "$PKG")"
for f in usr/share/hls-livecam-server/cv_notify.py \
         usr/share/hls-livecam-server/hls-livecam-suite \
         usr/share/hls-livecam-server/hls-livecam.target \
         usr/share/hls-livecam-server/home.html; do
    # Whole-line containment in pure bash: no pipe, so nothing can be
    # killed mid-write. The earlier `tar | grep -q` here returned 141 on a
    # correct package for precisely that reason, and piping the captured
    # listing instead would only have narrowed the window, not closed it --
    # PKG_FILES is around a hundred lines and a match on line 39 leaves the
    # producer sixty lines to write into a pipe grep has already left.
    case $'\n'"$PKG_FILES"$'\n' in
        *$'\n'"$f"$'\n'*) : ;;
        *) die "$PKG is missing $f" ;;
    esac
done
echo "  payload spot-checks present"

# --- 4. Install and verify -------------------------------------------
say "Installing on $(hostname)"
sudo pacman -U --noconfirm "$PKG"
sudo systemctl restart broadcast-api

# WAIT FOR READY, do not guess at it. `sleep 5` was a guess, and on 7.0.19 it
# lost the race: the API answered before Flask had its routes up, the version
# check got a non-JSON body, and the script reported FAILED for an install
# that was correct. A verification gate that cries wolf is worse than none --
# the next real failure gets waved through as "probably the usual flake".
# Polls for the answer it is about to assert on, and still fails loudly if it
# never arrives.
printf '  waiting for the API'
for _ in $(seq 1 40); do
    if curl -fsS --max-time 2 http://localhost:5000/api/info 2>/dev/null \
       | python3 -c 'import sys,json; sys.exit(0 if json.load(sys.stdin).get("version") else 1)' 2>/dev/null; then
        printf ' ready\n'; break
    fi
    printf '.'; sleep 1
done
printf '\n'

say "Verification"
FAIL=0
check() { if [ "$2" = "$3" ]; then printf '  OK   %-28s %s\n' "$1" "$2"
          else printf '  FAIL %-28s got %s, wanted %s\n' "$1" "$2" "$3"; FAIL=1; fi; }
check "pacman version"   "$(pacman -Qi laptop-livecam | awk '/^Version/{print $3}')" "$VER-1"
check "api version"      "$(curl -s http://localhost:5000/api/info | python3 -c 'import sys,json;print(json.load(sys.stdin).get("version",""))')" "$VER"
check "broadcast-api"    "$(systemctl is-active broadcast-api)" "active"
check "viewer /llc"      "$(curl -s -o /dev/null -w '%{http_code}' http://localhost:8080/llc)" "200"
check "home page /"      "$(curl -s -o /dev/null -w '%{http_code}' http://localhost:8080/)" "200"
check "cv_notify matches tag" \
      "$(md5sum /usr/share/hls-livecam-server/cv_notify.py | cut -d' ' -f1)" \
      "$(git -C "$SRC" show "v$VER:pkg/usr/share/hls-livecam-server/cv_notify.py" | md5sum | cut -d' ' -f1)"
[ "$FAIL" -eq 0 ] || die "verification failed -- see above"

say "Done"
echo "laptop-livecam $VER-1 installed from v$VER ($COMMIT)."
echo "Next: commit PKGBUILD/.SRCINFO here, then publish the update:"
echo "    git -C \"$PWD\" push aur HEAD:master"
echo "This package is already published on the AUR. Pushing the bump is"
echo "the release, not a decision -- leaving it unpushed just means every"
echo "AUR user stays on the last version that was."
