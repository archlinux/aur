# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info
pkgname=dict-freedict-eng-fra
pkgver=0.1.5
pkgrel=1
pkgdesc="English -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/English%20-%20French/$pkgver/freedict-eng-fra-$pkgver.tar.bz2")
sha512sums=('f72eb5da576a3c8d459f2d39ed4adfa9442442293997319ce4558ad2cc6d2e4428d2b84567163961b338724990732dd98f6094768928c43da483f74183c7c99b')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp eng-fra/eng-fra.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
