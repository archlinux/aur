# Maintainer: bhattaraiprayogdb-eng <bhattaraiprayogdb@gmail.com>
pkgname=lino-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="A sleek and fast text editor"
arch=('x86_64')
url="https://github.com/bhattaraiprayogdb-eng/lino"
license=('MIT')
depends=('libxkbcommon')
provides=('lino')
conflicts=('lino')
source=("lino::https://github.com/bhattaraiprayogdb-eng/lino/releases/download/v${pkgver}/lino")
sha256sums=('3cfe57b60bdb27cba802ca5b3652d9281a978cf3f58b275a709ec73ab400b129')

package() {
    install -Dm755 "${srcdir}/lino" "${pkgdir}/usr/bin/lino"
}
