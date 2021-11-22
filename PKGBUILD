# Maintainer: Yurii Kolesykov <root@yurikoles.com>
# Contributor: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20211025
pkgrel=1
license=(GPL)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=(https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('8e1c16b4e3773464d64a4cb272fe8771c35f96661c2acce713d8d9758acacf7e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
