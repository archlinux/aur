pkgname=inkstitch
pkgver=3.2.2
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux-${arch}.tar.xz")
sha256sums=('3378d5bff4f70ffbf31beea22572d4191f1495d672f431f37fe8e060b773155f')
license=(GPL)
options=(!strip)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
