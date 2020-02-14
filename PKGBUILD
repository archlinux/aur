# Maintainer : yaute <yaute74@gmail.com>
# Contributor: Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
mainver=2.1
pkgver=${mainver}.2.2635
pkgrel=1
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ho1"
license=(LGPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://github.com/akasolace/HO/releases/download/$mainver/HO-$pkgver.deb)

sha256sums=('3a127244a0832fae0ef483c1dbfbd915a54241865c8033c5d2e13b5bf1a54352')

package() {
cd $srcdir
bsdtar xf  HO-$pkgver.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}

