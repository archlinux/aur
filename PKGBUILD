# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: turborob <robertcgagne at gmail dot com>
# Contributor: foalsrock <foalsrock at gmail dot com>

pkgname=compass-icon-theme
pkgver=1.3.6
pkgrel=1
pkgdesc='The alternative icon theme for the .nitrux Operating System'
url='http://nitrux.in/store/artwork-store/compass-icon-theme/'
license=('cc-by-nc-nd-4.0')
depends=('librsvg')
arch=('any')
source=("http://nitrux.in/downloads/files/free/${pkgname}-${pkgver}.tar.gz")
md5sums=('4c635ce9760926dee31a7bdf22ebc39a')

package() {
  mkdir -p "${pkgdir}/usr/share/icons/"
  cp -r "${srcdir}/Compass" "${pkgdir}/usr/share/icons/Compass"

  install -Dm644 "${srcdir}/Compass/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
