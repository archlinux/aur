# Maintainer: Ivan Petruk <localizator at ukr dot net>

pkgname=compass-kde-icon-theme
pkgver=1.3.6
pkgrel=1
pkgdesc="The alternative icon theme for the .nitrux Operating System"
url="https://nitrux.in/store/compass-icon-theme/"
license=('cc-by-nc-nd-4.0')
arch=('any')
depends=('librsvg')
source=("compass-icon-theme-kde-${pkgver}.tar.gz::http://nitrux.in/downloads/files/free/compass-icon-theme-kde-${pkgver}.tar.gz")
sha256sums=('ae8a231b90120479000e9dd52bf09ad7652fba6fd08673910c57e0b64066c106')

package() {
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -r "${srcdir}/Compass" "${pkgdir}/usr/share/icons/"
 
  install -Dm644 "${srcdir}/Compass/COPYING" \
    "${pkgdir}/usr/share/licenses/Compass/LICENSE"
}
