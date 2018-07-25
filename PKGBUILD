# Maintainer: mockroot <mockroot@zoho.com>

_name=kde-plasma-chili
pkgname=sddm-theme-${_name}
pkgver=0.5.2
pkgrel=1
pkgdesc="Chili login theme for KDE Plasma"
arch=('any')
url="https://github.com/MarianArlt/kde-plasma-chili"
license=('GPL3')
depends=('sddm' 'plasma-desktop')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('eb5a5187274a401bfc58e4e4a3caeb8e')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r ${_name}-${pkgver} "${pkgdir}"/usr/share/sddm/themes/plasma-chili
}
