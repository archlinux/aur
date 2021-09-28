# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=crabz-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('d25c8854327663793cd9ca62924a8d3745239f5252a1d362d7f3015e6ab758c6')

package() {
    install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}

