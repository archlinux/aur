#!/usr/bin/env bash
# Maintainer helper: point the PKGBUILD at the latest signed Notion Flatpak
# commit for every architecture.
#
#   ./update.sh            update the generated block in PKGBUILD and .SRCINFO
#
# Notion publishes its Linux build only as a signed OSTree (Flatpak) repository.
# Each commit has a from-scratch static delta: a superblock, delta parts, and
# "fallback" objects for large files. Those are plain HTTPS files, so they can be
# listed in source=() with SHA-256 sums; prepare() rebuilds a local repository
# from them, then pulls and verifies the commit offline against notion.gpg.
set -euo pipefail
cd "$(dirname "$0")"

REPO_URL=https://app.linux-packages.notion.com
COLLECTION=com.notion.LinuxPackages.Prod
APP_ID=com.notion.app.desktop.notion
KEY_FPR=7B67273DAE0520508D6B8B0E1BF8637650053829
ARCHES=(x86_64 aarch64)

for c in ostree gpg curl sha256sum python3 makepkg; do
  command -v "$c" >/dev/null || { echo "missing $c" >&2; exit 1; }
done
[[ "$(gpg --show-keys --with-colons notion.gpg | awk -F: '$1=="fpr"{print $10; exit}')" == "$KEY_FPR" ]] ||
  { echo "notion.gpg does not have fingerprint $KEY_FPR" >&2; exit 1; }

work="${XDG_CACHE_HOME:-$HOME/.cache}/notion-app-electron-update"
mkdir -p "$work"
repo="$work/repo"
[[ -d "$repo/objects" ]] || ostree --repo="$repo" init --mode=bare-user-only
ostree --repo="$repo" remote delete --if-exists notion
ostree --repo="$repo" remote add --set=gpg-verify=true --set=gpg-verify-summary=true \
  --collection-id="$COLLECTION" --gpg-import=notion.gpg notion "$REPO_URL/" >/dev/null

# OSTree's modified base64 of a checksum, as used in deltas/ paths.
delta_path() {
  python3 -I -c '
import base64, sys
b = base64.b64encode(bytes.fromhex(sys.argv[1])).decode().rstrip("=").replace("/", "_")
print(b[:2] + "/" + b[2:])' "$1"
}

fetch() { # url dest  (prints sha256)
  if [[ ! -f "$2" ]]; then
    curl --fail --silent --show-error --location --retry 3 -o "$2.tmp" "$1" || return
    mv "$2.tmp" "$2" || return
  fi
  sha256sum "$2" | cut -d' ' -f1
}

summary="$(ostree --repo="$repo" remote summary notion)"
version=""
block=""
for arch in "${ARCHES[@]}"; do
  ref="app/$APP_ID/$arch/stable"
  commit="$(awk -v ref="$ref" 'index($0, ref ")") {f=1; next} f && /^ +[0-9a-f]{64} *$/ {gsub(/ /,""); print; exit}' <<<"$summary")"
  [[ -n "$commit" ]] || { echo "no commit for $ref" >&2; exit 1; }
  ostree --repo="$repo" pull --commit-metadata-only notion "$ref" >/dev/null
  subject="$(ostree --repo="$repo" show "$commit")"
  v="$(sed -nE 's/.*Notion-(arm64-)?([0-9][0-9.]*)\.flatpak.*/\2/p' <<<"$subject")"
  [[ -n "$v" ]] || { echo "cannot read version from $commit" >&2; exit 1; }
  [[ -z "$version" || "$version" == "$v" ]] || { echo "arch versions differ: $version vs $v" >&2; exit 1; }
  version="$v"

  dp="$(delta_path "$commit")"
  url_dp="${dp//+/%2B}"
  d="$work/$arch/$commit"; mkdir -p "$d"
  srcs=(); sums=()
  sums+=("$(fetch "$REPO_URL/deltas/$url_dp/superblock" "$d/superblock")")
  srcs+=("notion-\${pkgver}-$arch.superblock::\$_repo/deltas/$url_dp/superblock")
  # Parts start at 0. OSTree checks the count after the last part download.
  mkdir -p "$repo/deltas/$dp"; cp "$d/superblock" "$repo/deltas/$dp/superblock"
  i=0
  while fetch "$REPO_URL/deltas/$url_dp/$i" "$d/part$i" >/dev/null 2>&1; do
    cp "$d/part$i" "$repo/deltas/$dp/$i"
    sums+=("$(sha256sum "$d/part$i" | cut -d' ' -f1)")
    srcs+=("notion-\${pkgver}-$arch.part$i::\$_repo/deltas/$url_dp/$i")
    i=$((i + 1))
  done
  rm -f "$d/part$i.tmp"
  info="$(LC_ALL=C ostree --repo="$repo" static-delta show "$commit")"
  rm -rf "$repo/deltas/$dp"
  parts="$(sed -n 's/^Number of parts: //p' <<<"$info")"
  [[ "$parts" == "$i" ]] || { echo "$arch: expected $parts delta parts, downloaded $i" >&2; exit 1; }
  for kind in commit commitmeta; do
    sums+=("$(fetch "$REPO_URL/objects/${commit:0:2}/${commit:2}.$kind" "$d/$kind")")
    srcs+=("notion-\${pkgver}-$arch.$kind::\$_repo/objects/${commit:0:2}/${commit:2}.$kind")
  done
  while read -r obj; do
    sums+=("$(fetch "$REPO_URL/objects/${obj:0:2}/${obj:2}.filez" "$d/$obj.filez")")
    srcs+=("$obj.filez::\$_repo/objects/${obj:0:2}/${obj:2}.filez")
  done < <(grep -E '^  [0-9a-f]{64}$' <<<"$info" | tr -d ' ')

  block+="_commit_$arch=$commit"$'\n'
  block+="_delta_$arch='$dp'"$'\n'
  block+="source_$arch=("$'\n'
  for s in "${srcs[@]}"; do block+="	\"$s\""$'\n'; done
  block+=")"$'\n'
  block+="sha256sums_$arch=("$'\n'
  for s in "${sums[@]}"; do block+="	'$s'"$'\n'; done
  block+=")"$'\n'
  echo "$arch: Notion $version, commit ${commit:0:12}, $parts delta part(s), $(grep -cE '^  [0-9a-f]{64}$' <<<"$info") fallback object(s)" >&2
done

python3 -I - "$version" "$block" <<'PY'
import re, sys
version, block = sys.argv[1], sys.argv[2]
p = "PKGBUILD"
s = open(p).read()
begin, end = "# BEGIN GENERATED SOURCES (update.sh)\n", "# END GENERATED SOURCES\n"
i, j = s.index(begin) + len(begin), s.index(end)
s = s[:i] + block + s[j:]
old = re.search(r"^pkgver=(.*)$", s, re.M).group(1)
s = re.sub(r"^pkgver=.*$", f"pkgver={version}", s, flags=re.M)
if old != version:
    s = re.sub(r"^pkgrel=.*$", "pkgrel=1", s, flags=re.M)
open(p, "w").write(s)
PY
makepkg --printsrcinfo > .SRCINFO
echo "PKGBUILD now pins Notion $version" >&2
