# For maintainer use only.

cd "$(dirname "$0")"
PKGBASE="$(pwd)"

TMP="$(mktemp -d)"
cd "${TMP}"

wget -q "https://github.com/Kethsar/ytarchive/releases/download/latest/"{ytarchive_linux_amd64.zip,SHA2-256SUMS}
sha256sum --ignore-missing -c SHA2-256SUMS && bsdtar -xf ytarchive_linux_amd64.zip

# Parse out base version from e.g. "ytarchive 0.3.0-2d87608"
base_version=$(./ytarchive -V 2> >(grep -oP '(?<= )(\d+\.){2}\d+(?=-)'))
release_time=$(TZ=UTC date -d@$(stat --printf='%Y' ytarchive) +%Y%m%d.%H%M%S)

cd "${PKGBASE}"
perl -pe "s/(pkgver=).*/\${1}${base_version}.${release_time}/;" -i PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

rm -rvf "${TMP}"
