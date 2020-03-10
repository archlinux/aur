# Maintainer: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20200210
pkgrel=1
license=( "GPL" )
pkgdesc="Build packages in a sandboxed environment"
url="https://github.com/openSUSE/obs-build"
arch=( "any" )
depends=( "perl" )
source=( "https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz" )
sha256sums=( "b914f7be7ee368358535ea50c1da06dda8db1ac8edba3690a49d38a6dfcd387a" )

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
