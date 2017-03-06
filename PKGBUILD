# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
pkgname=dict-freedict-deu-fra
pkgver=2016_11_20
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/German%20-%20French/${_pkgver}/freedict-deu-fra-${_pkgver}.tar.bz2")
sha512sums=('53e046b368c9d1ce24410993a53f4a18e15844291f7ad497c79b72d5dac928c784bdd56a8f0d7151663c68208555248af54043e8877ebc9a22ade81e1da4dc02')

package()
{
	mkdir -p "${pkgdir}/usr/share/dictd"
	cp deu-fra/deu-fra.{dict.dz,index} "${pkgdir}/usr/share/dictd/"
}
