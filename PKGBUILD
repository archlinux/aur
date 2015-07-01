# Maintainer: Jason Gerecke <killertofu@gmail.com> 
pkgname=intuos4-config
pkgver=0.002
pkgrel=2
pkgdesc="Command line tool to configure both the Wacom Intuos4 tablet’s displays and keys"
arch=('i686' 'x86_64')
url="http://braindump.kargulus.de/?p=432"
license=('GPL3')
depends=('python2' 'intuos4-led')
makedepends=('')
source=("http://braindump.kargulus.de/wp-content/uploads/${pkgname}-${pkgver}.tar.gz")
md5sums=('98e8c87a9a6a72a00d9a73fd19bd3ecb')
install=${pkgname}.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix "$pkgdir"

}
