# Maintainer: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>
pkgname='mnvm0026'
pkgver='3.5.8'
pkgrel=1
pkgdesc="a miniature Macintosh II emulator"
arch=('x86_64')
url="http://www.gryphel.com/c/minivmac/"
license=('GPL')
makedepends=(tar)
source=(https://www.gryphel.com/d/minivmac/minivmac-3.5.8/$pkgname-$pkgver-lx64.bin.tgz)
md5sums=('e81655df670a0422702006c96da10b75')

package() {
mkdir -p $pkgdir/usr/bin
mv $srcdir/'Mini vMac 26' $pkgdir/usr/bin/
}
