# Maintainer: Yurii Kolesykov <root@yurikoles.com>
# Contributor: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20211125
pkgrel=1
license=(GPL)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=(https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d3d007c4f6d0d121195c9a67bedf578731f96602101274166fb76f223c709eda')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
