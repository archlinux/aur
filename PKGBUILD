# Maintainer:  respiranto <respiranto@icloud.com>
# Contributor: akane      <grangerspit@gmail.com> <xmpp:heiß@neko.im>
pkgname=dict-freedict-deu-eng
pkgver=0.3.4
pkgrel=6
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/German%20-%20English/$pkgver/freedict-deu-eng-$pkgver.tar.bz2")
md5sums=('476f304c0b6c0901e67b05daf8bc215e')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp deu-eng/deu-eng.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
