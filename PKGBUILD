# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=uniso
pkgver=0.1.06
pkgrel=4
pkgdesc="a tool to extract a file hierarchy from an iso image"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/uniso/"
license=('GPL')
depends=('python2' 'cdrkit')
source=(http://downloads.sourceforge.net/uniso/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a0b45a86999b3b305e8e81ad846398c8')

build() {
sed -i '1s/python/python2/' ${srcdir}/uniso
}

package() {
install -Dm 755 ${srcdir}/uniso ${pkgdir}/usr/bin/uniso
}
