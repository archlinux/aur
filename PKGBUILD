# Maintainer: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>
pkgname='minivmac'
pkgver='3.5.8'
pkgrel=1
pkgdesc="a miniature early Macintosh emulator"
arch=('x86_64')
url="http://www.gryphel.com/c/minivmac/"
license=('GPL')
makedepends=(tar)
source=(https://www.gryphel.com/d/minivmac/minivmac-3.5.8/$pkgname-$pkgver-lx64.bin.tgz)
md5sums=('68168f06472b8d49c98f561ff72eb250')

package() {
mkdir -p $pkgdir/usr/bin
mv $srcdir/'Mini vMac' $pkgdir/usr/bin/
}
