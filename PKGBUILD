# Maintainer: c. c. piapiac <_c@piapiac.org>

pkgname=xcursor-plan9
pkgver=0.2
pkgrel=1
pkgdesc="Xorg cursor theme inspired and based on plan9 cursors"
arch=('any')
url="https://π.duncano.de/"
license=('unknown')
depends=('libxcursor')
source=("https://π.duncano.de/files/${pkgname}-${pkgver}.tar.xz")
md5sums=("79b0c5dea253bfba2dd32124454224b2")

package() {
    install -dm755 "$pkgdir"/usr/share/icons
    cp -r "$srcdir"/plan9 "$pkgdir"/usr/share/icons/
}
