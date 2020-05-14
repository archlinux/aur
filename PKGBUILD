# Maintainer : yaute <yaute74@gmail.com>
# Contributor: Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
mainver=3.0
pkgver=${mainver}.2.2728
pkgrel=1
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ho1"
license=(LGPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://github.com/akasolace/HO/releases/download/$mainver/HO-$pkgver.deb)

sha256sums=('51e1daa5383d5a5a4e4be69ce372d6748cb636af4910a30be0159f5dad82306d')

package() {
cd $srcdir
bsdtar xf  HO-$pkgver.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}

