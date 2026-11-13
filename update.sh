#!/usr/bin/env bash
# Atualiza o PKGBUILD do aula-f75-rs-bin para a última release estável do upstream.
# Uso: ./update.sh [--build] [--commit] [--push] [--dry-run]
set -euo pipefail

readonly GH_REPO='fredjunior54/aula-f75-rs'
readonly TARGET='x86_64-unknown-linux-gnu'
readonly REQUIRED=(
  'aula-f75'
  'packaging/aula-f75-rs.desktop'
  'udev/70-aula-f75.rules'
  'icons/hicolor/64x64/apps/aula-f75-rs.png'
  'icons/hicolor/128x128/apps/aula-f75-rs.png'
  'icons/hicolor/256x256/apps/aula-f75-rs.png'
  'LICENSE'
  'LICENSES/aula-f75-hub-MIT.txt'
  'assets/LICENSE-NerdFonts.txt'
)

die() { printf 'erro: %s\n' "$*" >&2; exit 1; }

do_build=0 do_commit=0 do_push=0 dry_run=0
for arg in "$@"; do
  case "$arg" in
    --build)   do_build=1 ;;
    --commit)  do_commit=1; do_build=1 ;;
    --push)    do_push=1; do_commit=1; do_build=1 ;;
    --dry-run) dry_run=1 ;;
    -h|--help) sed -n '2p' "${BASH_SOURCE[0]}"; exit 0 ;;
    *) die "argumento desconhecido: $arg" ;;
  esac
done

for tool in curl jq sed tar updpkgsums; do
  command -v "$tool" >/dev/null || die "'$tool' não encontrado (instale pacman-contrib)"
done

cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

current=$(sed -n 's/^pkgver=//p' PKGBUILD | head -n1)
[ -n "$current" ] || die 'pkgver não encontrado no PKGBUILD'

tag=$(curl -fsSL --retry 3 "https://api.github.com/repos/$GH_REPO/releases/latest" |
  jq -r 'select(.draft == false and .prerelease == false) | .tag_name // empty')
[ -n "$tag" ] || die 'não foi possível descobrir a última release estável'
latest=${tag#v}

if [ "$latest" = "$current" ]; then
  echo "PKGBUILD já está na última release ($latest) — nada a fazer."
  exit 0
fi

# só sobe: recusa rollback (ex.: release anterior a atual)
newest=$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -n1)
[ "$newest" = "$latest" ] || die "última release ($latest) é anterior à atual ($current); abortando"

archive="aula-f75-v$latest-$TARGET"
url="https://github.com/$GH_REPO/releases/download/v$latest/$archive.tar.gz"

echo "==> $current -> $latest"
echo "    $url"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

curl -fsSL --retry 3 -o "$tmp" "$url" || die "asset não disponível: $url"

list=$(tar -tzf "$tmp")
missing=()
for path in "${REQUIRED[@]}"; do
  grep -qxF "$archive/$path" <<<"$list" || missing+=("$path")
done
if ((${#missing[@]})); then
  printf 'erro: tarball de %s está incompleto, faltando:\n' "$latest" >&2
  printf '  %s\n' "${missing[@]}" >&2
  die 'PKGBUILD não foi alterado'
fi

if ((dry_run)); then
  echo "==> dry-run: PKGBUILD e .SRCINFO não foram alterados."
  exit 0
fi

sed -i -e "s/^pkgver=.*/pkgver=$latest/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "==> PKGBUILD e .SRCINFO atualizados para $latest"

if ((do_build)); then
  makepkg -f
  if command -v namcap >/dev/null; then
    namcap PKGBUILD || true
    namcap "aula-f75-rs-bin-$latest-1-$(uname -m).pkg.tar.zst" || true
  fi
fi

if ((do_commit)); then
  git add PKGBUILD .SRCINFO
  git commit -m "chore: atualiza para $latest"
fi

if ((do_push)); then
  git push origin master
fi
