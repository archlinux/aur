# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: akane <grangerspit@gmail.com> <xmpp:heiß@neko.im>
_lang=deu-eng
pkgname=dict-freedict-${_lang}
pkgver=0.3.4
pkgrel=6
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/$pkgver/freedict-${_lang}-$pkgver.tar.bz2")
md5sums=('476f304c0b6c0901e67b05daf8bc215e')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
