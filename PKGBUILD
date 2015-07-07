# Maintainer Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
pkgver=1.433
pkgrel=1
_rel=1433_r2501
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="http://www.hattrickorganizer.net"
license=(GPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(http://downloads.sourceforge.net/project/ho1/ho1/$pkgver/HO_$_rel.deb)

md5sums=('159ff4c728dddf6fc8c42f97eeebdb06')

build() {
cd $srcdir
bsdtar xf  HO_$_rel.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}
