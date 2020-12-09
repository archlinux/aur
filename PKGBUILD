# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: xpt <user.xpt@gmail.com>

# otfinfo --info *.otf

_name='Ryman Eco'
_pkgname='ryman-eco'
pkgname="otf-${_pkgname}"
pkgver=1.0
pkgrel=2
pkgdesc='Environmentally sustainable typeface'
arch=('any')
url='https://rymaneco.co.uk'
license=('custom')
source=("${_pkgname}-${pkgver}-${pkgrel}.zip::${url}/download/${_pkgname}.zip")
sha256sums=('be47185a8ae794ce56a837aae7d7687d46b0c6fd009fde8d299829e7950caa86')

package() {
  cd "${_name}"
  install -Dvm644 "${_name}/${_name/ /}-Regular.otf" -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dvm644 "${_name}Poster.pdf"  "${pkgdir}/usr/share/doc/${_pkgname}/poster.pdf"
  install -Dvm644 "${_name} End User License Agreement.pdf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.pdf"
}

# vim ts=2 sw=2 et:
