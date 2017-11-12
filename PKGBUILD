# Maintainer: pyjano <pyjano at protonmail dot com>

pkgname=otf-ibm-plex
pkgver=0.4.1
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces"
url="https://ibm.github.io/type/"
arch=(any)
license=(custom)
source=("https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=("d55d1bc07ec851f3541c860c0c9c434750e61663dda96e4551c7bac9e78e9a60")

package() {
  cd ${srcdir}/type-${pkgver}
  install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 fonts/Mono/desktop/mac/*.otf ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 fonts/Sans/desktop/mac/*.otf ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 fonts/Serif/desktop/mac/*.otf ${pkgdir}/usr/share/fonts/OTF
}
