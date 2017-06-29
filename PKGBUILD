# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=splines
pkgname=octave-$_pack
pkgver=1.3.2
pkgrel=1
pkgdesc="Additional spline functions."
arch=(any)
url="http://octave.sourceforge.net/${_pack}/"
license=('custom')
groups=('octave-forge')
depends=('octave>=3.6.0')
makedepends=()
optdepends=()
backup=()
options=()
install="${pkgname}.install"
_archive="${_pack}-${pkgver}.tar.gz"
source=("http://downloads.sourceforge.net/octave/${_archive}")
noextract=("${_archive}")
sha1sums=('49339e5ba31514d1c37871781bca13ef296bf087')
md5sums=('f682724bd68820d83c4e560fc49e144f')

package() {
  mkdir -p "${pkgdir}/usr/share/octave/packages"
  mkdir -p "${pkgdir}/usr/lib/octave/packages"
  cp "${srcdir}/${_archive}" "${pkgdir}/usr/share/octave/${_pack}.tar.gz"
}
