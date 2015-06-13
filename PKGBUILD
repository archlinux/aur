# Contributor: Manuel Unglaub <m.unglaub@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=silence
pkgver=0.2.1
pkgrel=2
pkgdesc="An information management tool."
arch=('i686' 'x86_64')
url="http://silence.sekalura.net"
license=('GPL2 only')
depends=('kdebase-runtime')
makedepends=('cmake')
source=("http://silence.sekalura.net/$pkgname-$pkgver.tar.gz")
md5sums=('b69d906abf321e29c3b8957e4fd4b9cb')

build() {
  cd "$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install

}
