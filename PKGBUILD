# Maintainer: mockroot <mockroot@zoho.com>

_name=kde-plasma-chili
pkgname=sddm-theme-${_name}
pkgver=0.5.4
pkgrel=1
pkgdesc="Chili login theme for KDE Plasma"
arch=('any')
url="https://github.com/MarianArlt/kde-plasma-chili"
license=('GPL3')
depends=('sddm' 'plasma-desktop')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('726914c09c4e89b62b431ef5acfe1e5186eac840070286c47dce6d613e8442b3')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -r ${_name}-${pkgver} "${pkgdir}"/usr/share/sddm/themes/plasma-chili
}
