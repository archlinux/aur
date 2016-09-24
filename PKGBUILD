# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=dict-freedict-fra-deu
pkgver=2016_09_23
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/French%20-%20German/$_pkgver/freedict-fra-deu-$_pkgver.tar.bz2")
md5sums=('0c3488c6842f38e9c946a6c6593e07f6')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp fra-deu/fra-deu.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
