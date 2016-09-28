# Maintainer: Fabian Schmidt <fceschmidt at posteo dot de>
pkgname=bullshit
pkgver=0.0
pkgrel=1
pkgdesc="Assemble a stream of technology bullshit from words in a file"
arch=('any')
url="https://github.com/fceschmidt/bullshit"
license=('GPL2')
depends=('gawk')
source=('https://raw.githubusercontent.com/fceschmidt/bullshit-arch/master/src/bullshit.tar.gz')
md5sums=('70f68f9ae1758f4e7677b2a5d141ee7b')

package(){
 install -Dm755 $srcdir/bullshit "$pkgdir/usr/bin/bullshit"
 install -Dm644 $srcdir/bullshit_lib "$pkgdir/usr/lib/bullshit"
}
