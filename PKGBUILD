# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=spa-eng
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=6
pkgdesc="Spanish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/$pkgver/freedict-${_lang}-$pkgver.tar.bz2")
md5sums=('9611215259c816cfb25d30c5becf8c96')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
