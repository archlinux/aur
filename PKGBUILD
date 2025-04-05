# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Johannes Dewender <arch@JonnyJD.net>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20250331
pkgrel=1
license=(GPL-2.0-only GPL-3.0-only)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('da7805a86d5188dde38e463c7b071ae26dcdb200e471d7bf15ef46087e9d5a27')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
