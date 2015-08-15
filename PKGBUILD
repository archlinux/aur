# Contributor: Athemis <athemis@ish.de>
# Contributor: ReNoM <renom [at] list [dot] ru>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=spring-ba
pkgver=9.05
pkgrel=1
pkgdesc="A popular balanced Spring mod based on Absolute Annihilation"
arch=(any)
url='https://springrts.com/wiki/Balanced_Annihilation'
license=('GPL' 'CCPL' 'custom:non-free')
depends=('spring')
source=("ba-v$pkgver.sdz::http://packages.springrts.com/builds/ba-V$pkgver.sdz"
	'license-non-free')
noextract=("ba-v$pkgver.sdz")
md5sums=('5fb424c97ba200e71e2ae733321c12db'
         '28872feaac21fc4b2b4ae00b3f86e52a')

PKGEXT='.pkg.tar'

package() {
	install -Dm 644 ba-v$pkgver.sdz "$pkgdir/usr/share/spring/games/ba-v$pkgver.sdz"
	install -Dm 644 license-non-free "$pkgdir/usr/share/licenses/$pkgname/non-free"
}
