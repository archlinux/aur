pkgname=inkstitch
pkgver=2.2.0
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux.tar.xz")
sha256sums=('70ed2be08e624a60c058141ef0e5ddb3d433cea8b3f58fcfbb7774f6ecbff176')
license=(GPL)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
