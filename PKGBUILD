# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=adjbacklight
pkgver=7.3
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('GPL3')
depends=('linux')
makedepends=('texinfo' 'auto-auto-complete')
source=(https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(bf051249df7d687bbe3788dbbfd4cfc41b9ed8d98426af218572563b22a82346)


build() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/"
}

package() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

