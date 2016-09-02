# Maintainer: Einhard Leichtfuß <respiranto@icloud.com>
pkgname=dict-freedict-deu-fra
pkgver=2015_07_19
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/German%20-%20French/$_pkgver/freedict-deu-fra-$_pkgver.tar.bz2")
md5sums=('c65070c1d2d9f9e466f105faffea3713')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp deu-fra/deu-fra.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
