# Maintainer : yaute <yaute74@gmail.com>
# Contributor: Foppe Hemminga <foppe@foppe.org>
# Contributor: mangus <mangus@deprecated.it>

pkgname=hattrick_organizer
pkgver=1.434
pkgrel=1
_rel=1434_r2696
pkgdesc="A manager assistent for the online football manager Hattrick "
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ho1"
license=(GPL)
depends=(java-runtime)
makedepends=(libarchive)
source=(https://downloads.sourceforge.net/project/ho1/ho1/1.434/HO_$_rel.deb)

md5sums=('311ec3b313b133a91718ff5b84f90b5e')

package() {
cd $srcdir
bsdtar xf  HO_$_rel.deb || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}

