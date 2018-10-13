# Maintainer: mockroot <mockroot@zoho.com>

_name=kde-plasma-chili
pkgname=sddm-theme-${_name}
pkgver=0.5.3
pkgrel=1
pkgdesc="Chili login theme for KDE Plasma"
arch=('any')
url="https://github.com/MarianArlt/kde-plasma-chili"
license=('GPL3')
depends=('sddm' 'plasma-desktop')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('30db45af47e8dfc03bf0330057f52ffd')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r ${_name}-${pkgver} "${pkgdir}"/usr/share/sddm/themes/plasma-chili
}
