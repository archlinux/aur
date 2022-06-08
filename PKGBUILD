# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=crabz-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Like pigz, but in Rust"
arch=('x86_64')
url="https://github.com/sstadick/crabz"
license=('MIT')
provides=('crabz')
conflicts=('crabz')
source=("crabz-${pkgver}::${url}/releases/download/v${pkgver}/crabz-linux-amd64")
sha256sums=('2d80a0ff87ba42405e0115bd95b522e44c9f6ab608e79c934e714ba8e01b50b0')

package() {
    install -D -m755 "crabz-$pkgver" "$pkgdir/usr/bin/crabz"
}

