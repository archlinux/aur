# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
_lang=fra-eng
pkgname=dict-freedict-${_lang}
pkgver=0.3.5
pkgrel=6
pkgdesc="French -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/$pkgver/freedict-${_lang}-$pkgver.tar.bz2")
md5sums=('0e3cf6e54654bfc25470dbb68a59363a')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp ${_lang}/${_lang}.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
