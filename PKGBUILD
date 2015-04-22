pkgname=pguri
pkgver=1.20150415
pkgrel=1
pkgdesc="uri data type for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguri/"
license=('none')
depends=('postgresql' 'uriparser')
source=(${url}archive/${pkgver}.tar.gz)
sha256sums=('97d671469678360432237777ffbde1f7a093c956676c46fb6c89b6a4576134db')

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
