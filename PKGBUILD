# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
# Contributor: Johannes Dewender <arch@JonnyJD.net>
#
# Pull Requests are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20250206
pkgrel=1
license=(GPL-2.0-only GPL-3.0-only)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fee74695402f9bc0b6aabad909b8713a52af1a11951ad3b3441c0ea82af00994')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
