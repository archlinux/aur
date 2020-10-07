pkgname=inkstitch
pkgver=1.29.1
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-v${pkgver}-linux-en_US.zip")
sha256sums=('23db5efed402be33cf5fc0388835af43adc6813451549031424e6c37117262b2')
license=(GPL)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
