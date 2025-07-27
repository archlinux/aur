# shellcheck disable=SC2034,SC2154
# - SC2034 - appears unused.
# - SC2154 - pkgdir is referenced but not assigned.

# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgname=chdig-bin
pkgver=25.7.1
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
    '80c611da25fe0e825646b62cd7b4b21768a1e6b8b994e384fb0da3e50d1e7a23'
)

package() {
    tar -C "$pkgdir" -xvf chdig-$pkgver-1-x86_64.pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
