# Maintainer : yaute <yaute74@gmail.com>
# Contributor: Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
mainver=2.0
pkgver=${mainver}.2.1458
pkgrel=1
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ho1"
license=(LGPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://github.com/akasolace/HO/releases/download/$mainver/HO_$pkgver.deb)

md5sums=('5d1fbf5386c003b74c5b9c8b7e57bcb5')

package() {
cd $srcdir
bsdtar xf  HO_$pkgver.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}

