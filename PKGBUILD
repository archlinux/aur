# Maintainer: Brian Clemens <brian@teknik.io>
pkgname=dict-freedict-jpn-eng
pkgver=0.1
pkgrel=1
pkgdesc="Japanese -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/Japanese%20-%20English/$pkgver/freedict-jpn-eng-$pkgver.tar.bz2")
md5sums=('bc3b8e3f9b93432ddefff7c3505f0001')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp jpn-eng/jpn-eng.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
