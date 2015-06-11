# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
pkgname=gamera
pkgver=3.4.2
pkgrel=1
pkgdesc="Framework for building document analysis applications."
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="http://gamera.informatik.hsnr.de"
license=('GPL')
depends=('python2' 'libtiff' 'libpng')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=${pkgdir} --prefix=/usr
}


md5sums=('ca31f70a9735203bc1f37073e8a2a495')
