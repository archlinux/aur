# Maintainer:  John Jenkins <twodopeshaggy@gmail.com>
# Contributer:  James Hendrie <hendrie dot james at gmail dot com>
pkgname=shalarm
pkgver=1.5
pkgrel=1
pkgdesc="A bash script that acts like an alarm clock."
arch=('any')
url="http://www.someplacedumb.net"
license=('custom:"FreeBSD"')
depends=(bash coreutils)
optdepends=('mplayer')
source=(http://www.someplacedumb.net/content/progs/shalarm/$pkgname-$pkgver.tar.gz)
md5sums=('d4e2a8967473240b2ff706182f04c9b4')

package()
{
    cd $srcdir/$pkgname-$pkgver
    make ROOTPATH="$pkgdir" install
}
