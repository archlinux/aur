# Maintainer: Einhard Leichtfuß <respiranto@icloud.com>
pkgname=dict-freedict-fra-deu
pkgver=0.1.1
pkgrel=6
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/French%20-%20German/$pkgver/freedict-fra-deu-$pkgver.tar.bz2")
md5sums=('b90134466560207553649c319bd92278')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp fra-deu/fra-deu.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
