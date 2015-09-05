# Maintainer: Ivan Petruk <localizator at ukr dot net>

pkgname=compass-kde-icon-theme
pkgver=1.3.2
pkgrel=1
pkgdesc="The alternative icon theme for the .nitrux Operating System"
url="http://nitrux.in/store/compass-for-kde/"
license=('cc-by-nc-nd-4.0')
arch=('any')
depends=('librsvg')
source=("compass-icon-theme-kde-${pkgver}.tar.gz::http://nitrux.in/downloads/files/free/compass-icon-theme-kde-${pkgver}.tar.gz")
sha256sums=('6a330ef8795cbc25f5cc6ed075426d8b297a050e0a1904d496c8687412644cc0')

package() {
  cd Compass

  install -dm 755 "$pkgdir"/usr/share/icons/Compass
  cp -dr --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Compass"

  install -Dm644 "${srcdir}/Compass/COPYING" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}