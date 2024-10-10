# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWUK).se>

pkgname=auto-auto-complete
pkgver=7.2.1
pkgrel=1
pkgdesc='Autogenerate shell auto-completion scripts'
arch=('any')
url='https://codeberg.org/maandree/auto-auto-complete'
license=('GPL3')
depends=('python3')
makedepends=('make' 'sed' 'coreutils' 'python3' 'texinfo')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/$pkgver.tar.gz)
sha256sums=(fc8ddf2354a016466ce80616308a601928a92f50155d0212ff07651c47387776)


build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}

