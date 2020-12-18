# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tspreed'
pkgver=1.2.2
pkgrel=1
pkgdesc='Terminal RSVP speed reader with Spritz-like functionality'
arch=('any')
url='https://github.com/n-ivkovic/tspreed'
license=('GPL3')
backup=("etc/${pkgname}/${pkgname}.rc")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('59ce8fe561a8745ec57d77dc701cdd81929ba743c5d0a63ed96176abf06c1c2b')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'default.rc' "${pkgdir}/etc/${pkgname}/${pkgname}.rc"
  install -Dvm644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
