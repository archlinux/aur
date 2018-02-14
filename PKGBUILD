# Contributor: pyjano <pyjano at protonmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-ibm-plex
pkgver=0.5.4
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif typefaces"
url="https://ibm.github.io/type/"
arch=('any')
license=('custom')
source=("https://github.com/IBM/type/archive/v$pkgver.tar.gz")
sha256sums=('7b719d560879854b80f8589d1d690c0fef079aaf98ef4360ce0132f3829c0ef5')

package() {
  cd type-${pkgver}
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 fonts/Mono/desktop/mac/*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 fonts/Sans/desktop/mac/*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 fonts/Serif/desktop/mac/*.otf "${pkgdir}"/usr/share/fonts/OTF
}
