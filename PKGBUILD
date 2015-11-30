# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=adjbacklight
pkgver=7.3.2
pkgrel=1
pkgdesc="Convenient method for adjusting the backlight on your portable computer"
arch=('x86_64' 'i686')
url="https://github.com/maandree/adjbacklight"
license=('GPL3')
depends=('linux')
makedepends=('texinfo' 'auto-auto-complete')
install=adjbacklight.install
source=(https://github.com/maandree/adjbacklight/archive/${pkgver}.tar.gz)
sha256sums=(75b7760a2cda157b0a27d3d4290c73e6b4219d9b08a3b6f466e8486aa6be7d0a)


build() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/"
}

package() {
  cd "${srcdir}/adjbacklight-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

