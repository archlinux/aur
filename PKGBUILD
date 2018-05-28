# Maintainer: Fabian Schmidt <fceschmidt at posteo dot de>
pkgname=bullshit
pkgver=0.0
pkgrel=3
pkgdesc="Assemble a stream of technology bullshit from words in a file"
arch=('any')
url="https://github.com/fceschmidt/bullshit-arch"
license=('GPL2')
depends=('gawk')
source=('https://raw.githubusercontent.com/fceschmidt/bullshit-arch/master/src/bullshit.tar.gz')
md5sums=('4eb749cd06de89fc4c87efc68b7a487f')

package(){
 install -Dm755 $srcdir/bullshit "$pkgdir/usr/bin/bullshit"
 install -Dm644 $srcdir/bullshit_lib "$pkgdir/usr/lib/bullshit"
}
