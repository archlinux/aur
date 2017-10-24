# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
pkgname=dict-freedict-eng-spa
pkgver=0.2.2
pkgrel=1
pkgdesc="English -> Spanish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/English%20-%20Spanish/$pkgver/freedict-eng-spa-$pkgver.tar.bz2")
sha512sums=('240a41fe8976dfb3c853fd6b8e7918a8fee0a8a3763be5c6ad65612eba342a3c12fdb2cd1429fb273839861bdb1fe50bac31c8ea334325cf96dc0c2ac0d16d64')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp eng-spa/eng-spa.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
