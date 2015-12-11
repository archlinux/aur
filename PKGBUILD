# Maintainer: Einhard Leichtfuß <respiranto@icloud.com>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
pkgname=dict-freedict-eng-fra
pkgver=0.1.4
pkgrel=6
pkgdesc="English -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20French/$pkgver/freedict-eng-fra-$pkgver.tar.bz2")
md5sums=('b0ac25998cdebefc897cb2c20374a7f2')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp eng-fra/eng-fra.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
