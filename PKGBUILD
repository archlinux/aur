# Maintainer: mockroot <mockroot@zoho.com>

_name=kde-plasma-chili
pkgname=sddm-theme-${_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="Chili login theme for KDE Plasma"
arch=('any')
url="https://github.com/MarianArlt/kde-plasma-chili"
license=('GPL3')
depends=('sddm' 'plasma-desktop')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('ea9f55983ae6be665f9a018ab801aaa0')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r ${_name}-${pkgver} "${pkgdir}"/usr/share/sddm/themes/plasma-chili
}
