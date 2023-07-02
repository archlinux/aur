# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# PRs are welcome here: https://github.com/yurikoles-aur/obs-build
#

pkgname=obs-build
pkgver=20230628
pkgrel=1
license=(GPL)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('97362f0c417a60edde276e5c6d32ce81ec0eda1e5f6ad277228779758dd2a479')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
