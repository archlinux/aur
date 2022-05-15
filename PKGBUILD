# Maintainer: Rellieberman <name AT gmail DOT com>
# Contributer:  John Jenkins <twodopeshaggy@gmail.com>
# Contributer:  James Hendrie <hendrie dot james at gmail dot com>
pkgname=shalarm
pkgver=1.7
pkgrel=3
pkgdesc="A bash script alarm clock."
arch=('any')
url="http://www.someplacedumb.net/content/progs/index.html#shalarm"
license=('custom:"FreeBSD"')
depends=(coreutils bash bc)
optdepends=('mplayer')
_zipname=8d44470c4dfba9484d5fabc1aacaa309bdfe8f2c
source=("${pkgname}_${pkgver}-${pkgrel}.zip::https://github.com/jahendrie/shalarm/archive/$_zipname.zip")
md5sums=('4209b7f93bd7b1471f46b2ff9a26e830')

package()
{
    cd ${srcdir}/${pkgname}-${_zipname}
    make ROOTPATH="$pkgdir" install
}
