# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=gob2
pkgver=2.0.20
pkgrel=1
pkgdesc="GTK Object Builder (GOB) is a simple preprocessor for easily creating GTK objects"
arch=(x86_64)
license=('GPL')
depends=('glib2')
url="http://www.5z.com/jirka/gob.html"
source=(http://ftp.5z.com/pub/gob/${pkgname}-${pkgver}.tar.xz)
md5sums=('b830859993bfa82bc8773207b9a4a698')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
