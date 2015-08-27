# Maintainer: Bert Burgemeister <trebbu@googlemail.com>
pkgname=guile-dbi
pkgver=2.1.5
pkgrel=1
pkgdesc='Guile Scheme generic database interface'
arch=(any)
license=(GPL2)
depends=(guile)
url=http://home.gna.org/guile-dbi/
source=(http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1abdef4473760ed7f6687f4f25365aa8')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make && make DESTDIR=${pkgdir} install || return 1
}
