# Maintainer: Lily Larsen <8o7wermobile at gmail dot com>
pkgname='otf-linja-sike'
pkgver='5'
pkgrel=1
pkgdesc="A toki pona font for the sitelen pona writing system"
arch=('any')
url="https://wyub.github.io/tokipona/linjasike"
license=('OFL') # TODO request license be hosted alongside linja sike
source=("linja-sike-${pkgver}.otf::https://wyub.github.io/tokipona/linja-sike-5.otf")
sha256sums=('4c970a20ae9bc816fdff3ca82874e684ca4e1b01d81bf64f9a6ef686e48efd8a')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/OTF"
  install -m 644 "linja-sike-${pkgver}.otf" "${pkgdir}/usr/share/fonts/OTF"
}
