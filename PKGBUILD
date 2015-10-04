# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Vasco Nunes <vascomfnunes at gmail dot com>
# Contributor: Pawel Rusinek <p.rusinek at gmail dot com>
#
pkgname="griffith-extra-artwork"
pkgver="0.9.4"
pkgrel="3"
pkgdesc="Extra artwork for Griffith, the movie collection manager application"
url="http://www.griffith.cc/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('griffith>=0.9')
provides=("${pkgname}")
source=("https://raw.githubusercontent.com/ValHue/AUR-PKGBUILDs/master/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('96bc01a05ad54aad9fabcf411809c46c78b990fc7656ea004cebdfd8ea9894fd')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=4 sw=2 ft=sh et:
