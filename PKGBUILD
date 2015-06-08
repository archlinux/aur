# Contributor: Nathan Owe <ndowens.aur at gmail.com>
pkgname=atom
pkgver=1.0
pkgrel=4
pkgdesc="Converts text files to html with special attrs"
arch=('i686' 'x86_64')
url="http://www.freebsd.org/cgi/url.cgi?ports/textproc/atom/pkg-descr"
license=('GPL2')
depends=('glibc')
source=(http://www.bayofrum.net/dist/atom/${pkgname}-${pkgver}.tar.gz)
md5sums=('d437c8dad83173bf0001d70ca68ed4af') 

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make 
  make DESTDIR=${pkgdir}/ install
}
