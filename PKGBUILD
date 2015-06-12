# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=adjbacklight
pkgver=7.2.1
pkgrel=1
pkgdesc="Convient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('GPL3')
depends=('linux')
makedepends=('gcc' 'make' 'coreutils')
source=(https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(76a429548e3b58d9cc2c98088c70d9a5d4e640bdd8ee8a17ef50a6693a903709)


build() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/"
}

package() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

