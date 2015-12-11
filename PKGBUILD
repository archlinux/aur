# Maintainer:  respiranto <respiranto@icloud.com>
# Contributor: akane      <grangerspit@gmail.com> <xmpp:heiß@neko.im>
pkgname=dict-freedict-eng-deu
pkgver=0.3.6
pkgrel=6
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20German/$pkgver/freedict-eng-deu-$pkgver.tar.bz2")
md5sums=('6b832d207ab166d49bff5e22e21ef328')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp eng-deu/eng-deu.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
