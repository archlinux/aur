# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWUK).se>

pkgname=auto-auto-complete
pkgver=7.2.2
pkgrel=1
pkgdesc='Autogenerate shell auto-completion scripts'
arch=('any')
url='https://codeberg.org/maandree/auto-auto-complete'
license=('custom:ISC')
depends=('python3')
makedepends=('python3')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=(30b025beccc4a255129ad8dbc8825961cb52060e140f55577bdc8979244761da)


build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
