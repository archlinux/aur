# Maintainer: Fabian Schmidt <fceschmidt at posteo dot de>
pkgname=bullshit
pkgver=0.0
pkgrel=1
pkgdesc="Assemble a stream of technology bullshit from words in a file"
arch=('any')
url="https://github.com/fceschmidt/bullshit"
license=('GPL2')
depends=('gawk')

package(){
 install -Dm755 $srcdir/bullshit "$pkgdir/usr/bin/bullshit"
 install -Dm644 $srcdir/bullshit_lib "$pkgdir/usr/lib/bullshit"
}
