# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=gob2
pkgver=2.0.19
pkgrel=1
pkgdesc="GTK Object Builder (GOB) is a simple preprocessor for easily creating GTK objects"
arch=(i686 x86_64)
license=('GPL')
depends=('glib2')
url="http://www.5z.com/jirka/gob.html"
source=(http://ftp.5z.com/pub/gob/${pkgname}-${pkgver}.tar.xz)
md5sums=('d7f2e7b96c33458d69b6381e28e4ac69')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
