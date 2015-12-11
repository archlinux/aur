# Maintainer:  respiranto <respiranto@icloud.com>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
pkgname=dict-freedict-fra-eng
pkgver=0.3.5
pkgrel=6
pkgdesc="French -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/French%20-%20English/$pkgver/freedict-fra-eng-$pkgver.tar.bz2")
md5sums=('0e3cf6e54654bfc25470dbb68a59363a')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp fra-eng/fra-eng.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
