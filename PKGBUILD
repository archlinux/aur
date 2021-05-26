# Maintainer: Yurii Kolesykov <root@yurikoles.com>
# Contributor: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20210120
pkgrel=1
license=(GPL)
pkgdesc="Build packages in a sandboxed environment"
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=(https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('070c493720490d8bee9d43dfac673027a7a06485cd0d2f0ab9be2105fe3b8584')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
