# Maintainer: Bert Burgemeister <trebbu@googlemail.com>
pkgname=guile-dbi
pkgver=2.1.6
pkgrel=1
pkgdesc='Guile Scheme generic database interface'
arch=(any)
license=(GPL2)
depends=(guile)
url=http://home.gna.org/guile-dbi/
source=(http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('09061e538b648bb113a218ef31339c70')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make DESTDIR="${pkgdir}" install
}
