# Maintainer: Benedikt Heine <benedikt@heine.rocks>
#   - ported to AUR4 from upstream PKGBUILD

pkgname=repo-make
pkgver=1.2.0
pkgrel=3
pkgdesc="Tool to autobuild a set of PKGBUILDs into a working repository"
arch=('any')
url="http://repo-make.tuxfamily.org/"
license=('AGPL3')
depends=('perl')
source=(http://downloads.tuxfamily.org/repomake/${pkgname}-${pkgver}.tar.xz)
sha256sums=('4b9cb580dc82238210d4697e4dd257a399caea6d33985bdb937335269b3b9879')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=$pkgdir PREFIX=/usr install
}
