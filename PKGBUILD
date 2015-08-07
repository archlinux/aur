# Contributor: akane      <grangerspit@gmail.com> <xmpp:heiß@neko.im>
# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-eng-deu
pkgver=0.3.6
pkgrel=1
pkgdesc="English -> German dictionary for dictd from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
depends=(dictd)
install=dict-freedict-eng-deu.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20German/$pkgver/freedict-eng-deu-$pkgver.tar.bz2")
md5sums=('6b832d207ab166d49bff5e22e21ef328')

package()
{
	mkdir -p $pkgdir/usr/share/dictd
	cp $srcdir/eng-deu/eng-deu.{dict.dz,index} $pkgdir/usr/share/dictd/
}
