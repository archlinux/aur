pkgname=inkstitch
pkgver=3.0.1
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux.tar.xz")
sha256sums=('b67c88242dbeafbd44c78e4b70a6dc3860d04a417c012a13439819bf97789c61')
license=(GPL)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
