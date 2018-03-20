# Maintainer: levinit <levinit@outlook.com>
pkgname=gimp-plugin-export-layers
pkgver=3.0
pkgrel=2
gimpver=2.0
pkgdesc="GIMP plug-in that exports layers as separate images."
arch=(any)
url="https://github.com/khalim19/gimp-plugin-export-layers"
license=('GPL3')
depends=('gimp' 'python')
makedepends=('unzip')

source=("https://github.com/khalim19/gimp-plugin-export-layers/releases/download/3.0-RC2/export_layers-$pkgver-RC$pkgrel.zip")

md5sums=('SKIP')

package() {
    install -Ddm755 $pkgdir/usr/lib/gimp/$gimpver/plug-ins
    cd $srcdir
    cp -r export_layers.py export_layers pygimplib -t $pkgdir/usr/lib/gimp/2.0/plug-ins
}
