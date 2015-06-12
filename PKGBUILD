# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=discwrapper
pkgver=1.2.2
pkgrel=2
pkgdesc="a cover designer for home-made discs"
url="http://sourceforge.net/projects/discwrapper"
arch=('i686' 'x86_64')
license=('GPL')
depends=('wxgtk' 'shared-mime-info')
source=("http://downloads.sourceforge.net/discwrapper/${pkgname}-${pkgver}.tar.gz")
md5sums=('6003fef596dcda6e6771bfdddda646fd')
build() {
cd $srcdir/${pkgname}-$pkgver
./configure --prefix=/usr
make
}

package() {
cd $srcdir/${pkgname}-$pkgver
make DESTDIR=${pkgdir} install
}
