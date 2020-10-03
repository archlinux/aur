# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='rotcheck'
pkgver=1.1.2
pkgrel=1
pkgdesc='Recursively generate, update and verify checksums for your files'
arch=('any')
url='https://github.com/jamielinux/rotcheck'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('09a80f936c9ac9096d614616abbe097d2bcde5049228de977ebeedef227d3e05')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:

