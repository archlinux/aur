# Maintainer : yaute <yaute74@gmail.com>
# Contributor: Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
mainver=1.436
pkgver=${mainver}.2.1064
pkgrel=1
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ho1"
license=(LGPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://github.com/akasolace/HO/releases/download/$mainver/HO_$pkgver.deb)

md5sums=('345d2768ea2c73adf9b36503ecb425c4')

package() {
cd $srcdir
bsdtar xf  HO_$pkgver.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}

