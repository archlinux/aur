# Maintainer: levinit <levinit@outlook.com>
pkgname=gimp-plugin-export-layers
pkgver=3.3.1
pkgrel=1
gimpver=2.0
pkgdesc="GIMP plug-in that exports layers as separate images."
arch=(any)
url="https://github.com/khalim19/gimp-plugin-export-layers"
license=('GPL3')
depends=('gimp' 'python')
groups=(gimp-plugins)
makedepends=('unzip')

source=("https://github.com/khalim19/gimp-plugin-export-layers/releases/download/${pkgver}/export_layers-${pkgver}.zip")

md5sums=('SKIP')

package() {
    install -Ddm755 $pkgdir/usr/lib/gimp/$gimpver/plug-ins
    cd $srcdir
    cp -r export_layers.py export_layers -t ${pkgdir}/usr/lib/gimp/${gimpver}/plug-ins/
}
