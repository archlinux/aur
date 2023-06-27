pkgname=inkstitch
pkgver=3.0.0
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux.tar.xz")
sha256sums=('e7324afc91d2c49b8493ad2130a4091bbe1eb6154aa84e77d972bd2a03cbd8e6')
license=(GPL)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
