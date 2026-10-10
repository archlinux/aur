#!/usr/bin/env bash
# Sync linux-sp7 with Arch's `linux` package: pkgver, config, PGP keys,
# checksums. Then report any drift in Arch's prepare/build/package functions.
#
# Fast path: fetches one commit of Arch's packaging repo (shallow) and copies
# Arch's checksums for the kernel tarball and Arch patch, so nothing large is
# downloaded here. makepkg downloads the sources and checks them against those
# checksums and the PGP signatures.
#
#   ./update.sh           follow Arch's current main
#   ./update.sh <tag>     pin to an Arch package tag, e.g. 7.2.9.arch1-1
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

ARCH_REPO=${ARCH_REPO:-https://gitlab.archlinux.org/archlinux/packaging/packages/linux.git}
ref=${1:-main}

# --- 1. fetch Arch's packaging repo: one commit, no history ------------------
if [[ ! -d arch/.git ]]; then
  git init -q arch
  git -C arch remote add origin "$ARCH_REPO"
fi
git -C arch fetch -q --depth=1 --no-tags origin "$ref"
git -C arch checkout -q --detach FETCH_HEAD

_src() {  # $1=PKGBUILD -> "name<TAB>sha256<TAB>b2" per source entry
  bash -c '
    CARCH=x86_64
    source "$1" >/dev/null
    emit() {
      local -n s=$1 sha=$2 b2=$3; local i n
      for i in "${!s[@]}"; do
        n=${s[i]%%::*}
        printf "%s\t%s\t%s\n" "${n##*/}" "${sha[i]-SKIP}" "${b2[i]-SKIP}"
      done
    }
    emit source        sha256sums        b2sums
    emit source_x86_64 sha256sums_x86_64 b2sums_x86_64
  ' _ "$1"
}

_block() {  # $1=marker; stdin replaces the lines between BEGIN/END $1
  local tmp; tmp=$(mktemp); cat > "$tmp"
  sed -i -e "/^# BEGIN $1/,/^# END $1/{
  /^# BEGIN $1/{p;r $tmp
  };/^# END $1/p;d}" PKGBUILD
  rm -f "$tmp"
}

# --- 2. pkgver + validpgpkeys ------------------------------------------------
arch_pkgver=$(bash -c 'source arch/PKGBUILD >/dev/null; echo "$pkgver"')
echo "Arch linux packaging: $ref ($arch_pkgver)"

old_pkgver=$(sed -n 's/^pkgver=//p' PKGBUILD)
if [[ $arch_pkgver != "$old_pkgver" ]]; then
  echo "pkgver: $old_pkgver -> $arch_pkgver (pkgrel reset to 1)"
  sed -i -e "s/^pkgver=.*/pkgver=$arch_pkgver/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
fi

bash -c 'source arch/PKGBUILD >/dev/null
  echo "validpgpkeys=("; printf "  %s\n" "${validpgpkeys[@]}"; echo ")"' \
  | _block validpgpkeys

# --- 3. Arch's local source files (the kernel config) + keys -----------------
# File names come from Arch's source array, so a rename on their side
# (config -> config.x86_64) doesn't break this.
while IFS=$'\t' read -r n _ _; do
  if [[ $n != PKGBUILD && -f arch/$n ]]; then
    cp "arch/$n" "$n"
    echo "Copied $n from Arch"
  fi
done < <(_src arch/PKGBUILD)
if [[ -d arch/keys ]]; then rm -rf keys && cp -r arch/keys keys; fi

# --- 4. checksums: Arch's for shared sources, hash only our local files ------
declare -A a_sha a_b2
while IFS=$'\t' read -r n s b; do a_sha[$n]=$s; a_b2[$n]=$b; done < <(_src arch/PKGBUILD)

sha=() b2=()
while IFS=$'\t' read -r n _ _; do
  if [[ -v a_sha[$n] ]]; then
    sha+=("${a_sha[$n]}"); b2+=("${a_b2[$n]}")
  elif [[ -f $n ]]; then
    sha+=("$(sha256sum "$n" | cut -d' ' -f1)"); b2+=("$(b2sum "$n" | cut -d' ' -f1)")
  else
    echo "ERROR: no checksum for '$n' (not in Arch's PKGBUILD, not a local file)" >&2
    exit 1
  fi
done < <(_src PKGBUILD)

{
  echo 'sha256sums=('; printf "  '%s'\n" "${sha[@]}"; echo ')'
  echo 'b2sums=(';     printf "  '%s'\n" "${b2[@]}";  echo ')'
} | _block checksums

# Sources Arch has that we don't: those need porting by hand.
missing=$(comm -23 <(_src arch/PKGBUILD | cut -f1 | sort) <(_src PKGBUILD | cut -f1 | sort))
if [[ -n $missing ]]; then
  echo
  echo "WARNING: Arch's PKGBUILD has sources this one doesn't:"
  printf '  %s\n' $missing
fi

# Build deps Arch has that we don't (docs-only deps ignored).
_mdeps() { bash -c 'CARCH=x86_64; source "$1" >/dev/null; printf "%s\n" "${makedepends[@]}"' _ "$1" | sort -u; }
mdeps=$(comm -23 <(_mdeps arch/PKGBUILD) <(_mdeps PKGBUILD) \
  | grep -vE '^(graphviz|imagemagick|python-sphinx.*|python-yaml|texlive-.*)$' || :)
if [[ -n $mdeps ]]; then
  echo
  echo "WARNING: Arch's makedepends has entries this PKGBUILD lacks:"
  printf '  %s\n' $mdeps
fi

# --- 5. drift check ----------------------------------------------------------
# Compare function bodies (bash-normalized, comments stripped). Lines that are
# expected to differ are filtered out on both sides:
#   _sp7_config  our config hook in prepare()
#   htmldocs     we don't build the -docs package (pid_docs: Arch's
#                background docs job)
#   optdepends   ours adds iptsd; optdepends don't affect the build
# Trailing ';' is stripped because declare -f adds it depending on what follows,
# and $CARCH is spelled out because this PKGBUILD is x86_64-only.
_fns() {
  bash -c '
    CARCH=x86_64
    source "$1" >/dev/null
    for f in prepare build _package _package-headers; do declare -f "$f"; done
  ' _ "$1" | grep -vE '_sp7_config|htmldocs|pid_docs|optdepends=' \
    | sed -e 's/;[[:space:]]*$//' -e 's/\${CARCH}/x86_64/g' -e 's/\$CARCH/x86_64/g'
}
if diff -u --label "arch/PKGBUILD" --label "PKGBUILD" \
     <(_fns arch/PKGBUILD) <(_fns PKGBUILD) > .drift.diff; then
  echo "Drift check: build functions match Arch."
  rm .drift.diff
else
  echo
  echo "WARNING: Arch's build functions differ from this PKGBUILD:"
  cat .drift.diff
  echo
  echo "Port these changes into PKGBUILD before building (kept in .drift.diff)."
fi

cat <<EOF

Next:
  gpg --import keys/pgp/*.asc     # once, or when Arch adds a key
  makepkg -s                      # or: _localmodcfg=/path/modprobed.db makepkg -s
EOF
