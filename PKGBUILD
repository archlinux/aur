pkgname=inkstitch
pkgver=3.3.0
pkgrel=1
pkgdesc="An open source machine embroidery design platform based on Inkscape"
arch=("x86_64")
url="https://inkstitch.org/"
depends=("inkscape")
source=("https://github.com/inkstitch/inkstitch/releases/download/v${pkgver}/inkstitch-${pkgver}-linux-${arch}.tar.xz")
b2sums=('be0c86ac21b38cb566e5701151f01a7c7d6cda5062e3f2bca3b94cab2959ae21a2b771cd9450d6722287a3a902fc1ec4c0588ce215388e602e6aafccad96e1fe')
license=(GPL)
options=(!strip)

package() {
    mkdir -p $pkgdir/usr/share/inkscape/extensions
    cp -a $srcdir/* $pkgdir/usr/share/inkscape/extensions/
}
