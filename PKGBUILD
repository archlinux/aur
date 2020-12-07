# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tspreed'
pkgver=1.2.1
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a192e9b32b91c20a904914c07b171c60957da1a7674a3710975fed8593ec2dc8')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
