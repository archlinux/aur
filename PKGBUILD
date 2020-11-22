# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tspreed'
pkgver=1.1.0
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('68a70d70322a21bb2d3b7656f7c81d084cd3200c5172b7d84290e909e9757bd5')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
