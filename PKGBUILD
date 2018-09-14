# Maintainer: Rellieberman <name AT gmail DOT com>
# Contributer:  John Jenkins <twodopeshaggy@gmail.com>
# Contributer:  James Hendrie <hendrie dot james at gmail dot com>
pkgname=shalarm
pkgver=1.65
pkgrel=2
pkgdesc="A bash script alarm clock."
arch=('any')
url="http://www.someplacedumb.net"
license=('custom:"FreeBSD"')
depends=(bash coreutils)
optdepends=('mplayer')
_zipname=master
source=("$_zipname.zip::https://github.com/jahendrie/shalarm/archive/$_zipname.zip")
md5sums=('d5ae834b8955396debb8f8cbcc488461')

package()
{
    cd $srcdir/$pkgname-master
    make ROOTPATH="$pkgdir" install
}
