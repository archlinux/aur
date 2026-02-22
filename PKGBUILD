# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWUK).se>

pkgname=auto-auto-complete
pkgver=7.2.3
pkgrel=1
pkgdesc='Autogenerate shell auto-completion scripts'
arch=('any')
url='https://codeberg.org/maandree/auto-auto-complete'
license=('custom:ISC')
depends=('python3')
makedepends=('python3')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=(8b32792fe56d8ee21903b16061bc51554cb6068bd54ab0b16105d1b9a300d352)


build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
