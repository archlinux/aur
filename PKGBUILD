# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: akane <grangerspit@gmail.com> <xmpp:heiß@neko.im>
_lang=eng-deu
pkgname=dict-freedict-${_lang}
pkgver=0.3.6
pkgrel=6
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/$pkgver/freedict-${_lang}-$pkgver.tar.bz2")
md5sums=('6b832d207ab166d49bff5e22e21ef328')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
