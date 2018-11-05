# Maintainer: mockroot <mockroot@zoho.com>

_name=kde-plasma-chili
pkgname=sddm-theme-${_name}
pkgver=0.5.5
pkgrel=1
pkgdesc="Chili login theme for KDE Plasma"
arch=('any')
url="https://github.com/MarianArlt/kde-plasma-chili"
license=('GPL3')
depends=('sddm' 'plasma-desktop')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e85ab22bbc92fd6aafa9ca5648bff2d9a93205a02c3c82211ada55af40ec8f3b')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r ${_name}-${pkgver} "${pkgdir}"/usr/share/sddm/themes/plasma-chili
}
