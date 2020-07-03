# Maintainer: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20200520
pkgrel=1
license=( "GPL" )
pkgdesc="Build packages in a sandboxed environment"
url="https://github.com/openSUSE/obs-build"
arch=( "any" )
depends=( "perl" )
source=( "https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz" )
sha256sums=( "ca795a8f48c5a9f233876a7aff4f5ee86fdf7faec68e3dd422ccdf1c5ccaff85" )

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
