# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=crabz-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('c6848c121ad4dd71c33f9b572e19cb24bc1ea122363ee4fcf7376ea7b32464d0')

package() {
    install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}

