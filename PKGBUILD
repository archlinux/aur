# Maintainer: levinit <levinit@outlook.com>
pkgname=gimp-plugin-layers-to-divs
pkgver=0.1
pkgrel=1
gimpver=2.0
pkgdesc="Gimp plugin to create html divs from gimp layers"
arch=(any)
url="https://github.com/MrHeadwar/Layerstodivs"
license=('GPL3')
depends=('gimp' 'python')
makedepends=('git')

source=("https://github.com/MrHeadwar/Layerstodivs/archive/master.zip")
md5sums=('SKIP')

package() {
    cd $srcdir/Layerstodivs-master/
    install -Dm755 layerstodivs.py $pkgdir/usr/lib/gimp/$gimpver/plug-ins/layerstodivs.py
}
