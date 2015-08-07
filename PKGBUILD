# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-eng-fra
pkgver=0.1.4
pkgrel=1
pkgdesc="English -> French dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
depends=(dictd)
install=dict-freedict-eng-fra.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20French/$pkgver/freedict-eng-fra-$pkgver.tar.bz2")
md5sums=('b0ac25998cdebefc897cb2c20374a7f2')

package()
{
	mkdir -p $pkgdir/usr/share/dictd
	cp $srcdir/eng-fra/eng-fra.{dict.dz,index} $pkgdir/usr/share/dictd/
}
