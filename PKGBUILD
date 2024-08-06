pkgname=inkstitch
pkgver=3.1.0
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux.tar.xz")
sha256sums=('cb196008342aa6fa563db17bb37bd758782b7554d46660ae2e734973e69f509a')
license=(GPL)
options=(!strip)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
