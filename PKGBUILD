# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xpt <user.xpt@gmail.com>

_pkgname=ryman-eco
pkgname="otf-${_pkgname}"
pkgver=1.0
pkgrel=2
pkgdesc='Environmentally sustainable typeface'
arch=('any')
url='https://rymaneco.co.uk'
license=('custom')
source=("${_pkgname}-${pkgver}.zip::${url}/download/${_pkgname}.zip")
sha256sums=('be47185a8ae794ce56a837aae7d7687d46b0c6fd009fde8d299829e7950caa86')

package() {
  cd "Ryman Eco"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" "Ryman Eco/RymanEco-Regular.otf"
  install -Dm644 'Ryman EcoPoster.pdf'  "${pkgdir}/usr/share/doc/${_pkgname}/poster.pdf"
  install -Dm644 'Ryman Eco End User License Agreement.pdf' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.pdf"
}

# vim:set ts=2 sw=2 et:
