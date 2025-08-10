# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=25.8.1
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface (binaries for latest stable version)"
arch=('x86_64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')
source=(
    "https://github.com/azat/chdig/releases/download/v$pkgver/chdig-$pkgver-1-x86_64.pkg.tar.zst"
)
sha256sums=(
    '41637c920a5024b8372580515364363d055d963e85f48a330a44022fa9444abd'
)

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-x86_64.pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
