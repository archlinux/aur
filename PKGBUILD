pkgname=inkstitch
pkgver=2.1.2
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux.tar.xz")
sha256sums=('c0a431aec9b390790b9ff22e7cb8f22b24bb4ec367d2ce499e1ba255ee9ee7cd')
license=(GPL)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
