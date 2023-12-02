# Maintainer: Azat Khuzhin <a3at.mail@gmail.com>
pkgbase=chdig-bin
pkgname=chdig
pkgver=v0.4.0
pkgrel=1
pkgdesc="Dig into ClickHouse with TUI interface"
arch=('x86_64')
conflicts=("chdig")
provides=("chdig")
url="https://github.com/azat/chdig"
license=('MIT')

source=(
    "https://github.com/azat/chdig/releases/download/$pkgver/chdig-latest-x86_64.pkg.tar.zst"
)

sha256sums=(
    'SKIP'
)

package() {
    tar -C "$pkgdir" -xvf chdig-latest-x86_64.pkg.tar.zst
    rm -f "$pkgdir/.PKGINFO"
    rm -f "$pkgdir/.MTREE"
}
# vim set: ts=4 sw=4 et
