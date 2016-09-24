# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=dict-freedict-deu-fra
pkgver=2016_09_23
_pkgver=${pkgver//_/-}
_pkgver2=2016-09-24
pkgrel=1
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/German%20-%20French/$_pkgver2/freedict-deu-fra-$_pkgver.tar.bz2")
md5sums=('d8321d985cd5db9b29e483618ec877a9')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp deu-fra/deu-fra.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
