# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-fra-eng
pkgver=0.3.5
pkgrel=1
pkgdesc="French -> English dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
depends=(dictd)
install=dict-freedict-fra-eng.install
source=("http://sourceforge.net/projects/freedict/files/French%20-%20English/$pkgver/freedict-fra-eng-$pkgver.tar.bz2")
md5sums=('0e3cf6e54654bfc25470dbb68a59363a')

package()
{
	mkdir -p $pkgdir/usr/share/dictd
	cp $srcdir/fra-eng/fra-eng.{dict.dz,index} $pkgdir/usr/share/dictd/
}
