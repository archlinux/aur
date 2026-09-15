#!/bin/bash
# Fetch the latest tag from the skywire repo and update PKGBUILD.
#
# Handles alpha/rc/pr pre-release tags automatically:
#   Stable (v1.3.40):       pkgver=1.3.40  pkgrel=<next>  _rc=''
#   Pre-release (v1.3.40-alpha2): pkgver=1.3.40  pkgrel=0.alpha2  _rc='-alpha2'
#
# The 0.* pkgrel ensures pre-releases sort before the stable 1.3.40-1.
#
# Override with: _pvernew=1.3.40 _vrcnew=-alpha2 _prelnew=0.alpha2 ./updates.sh

# Fetch latest tag
# versionsort.suffix: without it git sorts v1.3.94-alpha1 AFTER v1.3.94 and a
# stable release bumps the package to its own pre-release (seen on 1.3.94).
_latest_tag=$(git -c versionsort.suffix=-alpha -c versionsort.suffix=-beta -c versionsort.suffix=-rc -c versionsort.suffix=-pr ls-remote --tags --refs --sort="version:refname" https://github.com/skycoin/skywire.git | tail -n1)
_latest_tag=${_latest_tag##*/}
_latest_tag=${_latest_tag//v/}

# Split into version and pre-release suffix
if [[ $_latest_tag == *-* ]]; then
	_version=${_latest_tag%%-*}
	_vrc="-${_latest_tag#*-}"
else
	_version=$_latest_tag
	_vrc=""
fi

# Allow overrides
[[ -n $_pvernew ]] && _version=$_pvernew
[[ -n $_vrcnew ]] && _vrc=$_vrcnew

source PKGBUILD

# Determine pkgrel
if [[ -z $_prelnew ]]; then
	if [[ -n $_vrc ]]; then
		# Pre-release: pkgrel=0.<suffix> sorts before stable release (pkgrel=1)
		_suffix=${_vrc#-}
		_prelnew="0.${_suffix}"
	else
		# Stable: increment pkgrel from AUR, or reset to 1 if version changed
		_prel="$(curl -s https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=${pkgname} | grep pkgrel | cut -d "=" -f2 | tr -d "'")"
		_prelnew=$_prel
		if [[ $_version == "$pkgver" ]]; then
			let _prelnew++
		else
			_prelnew=1
		fi
	fi
fi

echo "Tag: v${_version}${_vrc}"
echo "Setting pkgver=$_version, pkgrel=${_prelnew}, _rc=${_vrc}"

sed -i "s/^pkgver=.*/pkgver='${_version}'/" PKGBUILD
sed -i "s/^_rc=.*/_rc='${_vrc}'/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel='${_prelnew}'/" PKGBUILD

echo "Updating checksums for PKGBUILD(s)..."
updpkgsums
find *.PKGBUILD 2>/dev/null | parallel updpkgsums {}

echo "Creating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo
source PKGBUILD
echo "Result: pkgver=${pkgver} pkgrel=${pkgrel} _rc=${_rc}"
echo "Arch version: ${pkgver}-${pkgrel}"
echo "GitHub tag: ${_tag_ver}"

# Prune stale release archives. updpkgsums downloads the current version's
# per-arch tarballs (~85MB each × 6 arches) but never removes prior versions,
# so they pile up (this dir hit 2.4GB / 30 archives before this was added).
# Keep ONLY the current pkgver's archives — deletes trigger on a pkgver bump;
# a pkgrel-only bump keeps the same pkgver's tarballs untouched. Tarballs are
# gitignored build byproducts, so this never touches tracked files.
echo
echo "Pruning old release archives (keeping v${pkgver}${_rc})..."
for _f in skywire-v*.tar.gz; do
	[[ -e $_f ]] || continue
	case "$_f" in
		skywire-v${pkgver}${_rc}-*) : ;; # current version — keep
		*) echo "  rm $_f"; rm -f "$_f" ;;
	esac
done

echo
echo "git add -f " *PKGBUILD " .SRCINFO skywire-autoconfig skywire-update skywire-docker-update " *.desktop *.png *.service *.timer *.sh *.conf *.install
echo 'git commit -m " "'
echo "aurpublish ${pkgname}"
echo "git push"

# Non-blocking: mirror the current archives into the yay build cache and prune
# old ones there too, so `yay -S skywire-bin` reuses them instead of
# re-downloading. Guarded + `|| true` so it can NEVER fail the AUR update
# (run it last, effectively after the manual aurpublish/git push above).
_yaydir="$HOME/.cache/yay/skywire-bin"
if [[ -d $_yaydir ]]; then
	{
		cp -f skywire-v${pkgver}${_rc}-*.tar.gz "$_yaydir"/ 2>/dev/null
		find "$_yaydir" -maxdepth 1 -name 'skywire-v*.tar.gz' \
			! -name "skywire-v${pkgver}${_rc}-*.tar.gz" -delete 2>/dev/null
		echo "Synced current archives into $_yaydir (old ones pruned)."
	} || true
fi
