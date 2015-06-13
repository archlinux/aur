# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=cant
pkgver=0.8.15
pkgrel=1
pkgdesc="The Canterbury Distribution Package Manager"
arch=('any')
url='http://www.archlinux.org/'
license=('GPL')
depends=('pacman' 'bash')
source=("cant")
md5sums=('85d758dec094ac48c5a2345c5a6a163e')

package() {
	install -D -m755 ${srcdir}/cant ${pkgdir}/usr/bin/cant
}
