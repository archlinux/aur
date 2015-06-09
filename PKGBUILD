# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Vasco Nunes <vascomfnunes at gmail dot com>
# Contributor: Pawel Rusinek <p.rusinek at gmail dot com>

pkgname="griffith-extra-artwork"
pkgver="0.9.4"
pkgrel="2"
pkgdesc="Extra artwork for Griffith, the movie collection manager application"
url="http://www.griffith.cc/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('griffith>=0.9')
provides=("${pkgname}")
source=("http://softlayer-ams.dl.sourceforge.net/project/griffith.berlios/${pkgname}-${pkgver}.tar.gz")
md5sums=('a18f9f900dc467f8ee801bb70776072f')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
