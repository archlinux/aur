# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=fra-deu
pkgname=dict-freedict-${_lang}
pkgver=2016_11_20
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.tar.bz2")
sha512sums=('0b3081d820572c9b4164afed72b28164182078f07ab3c71ce0da4c5ff2fb4cb7c8c67b1118c6009e5480e3666971860aa4c50267d38d7322a340fb7bc4e5b2aa')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
