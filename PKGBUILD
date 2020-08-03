# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Javier Tia <javier.tia@gmail.com>

_pkgname=Office-Code-Pro
pkgname=${_pkgname,,}
pkgver=1.004
pkgrel=1
pkgdesc='Customized version of Source Code Pro'
arch=('any')
url='https://github.com/nathco/Office-Code-Pro'
license=('custom: SIL Open Font License 1.1')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('9bca923d17f6c47a586d8e4567d46ccfa58fb8b8e2247b5ee2a19da1597c58f6')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${_pkgname}-${pkgver}/Fonts/Office Code Pro/OTF/"*.otf
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "${_pkgname}-${pkgver}/Fonts/Office Code Pro D/OTF/"*.otf
  install -Dm644 "${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
