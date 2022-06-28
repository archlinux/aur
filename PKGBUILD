# Contributor: Athemis <athemis@ish.de>
# Contributor: ReNoM <renom [at] list [dot] ru>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=spring-ba
pkgver=15.1.4
pkgrel=1
pkgdesc='A fan mod of Total Annihilation with remastered graphics and balance'
arch=(any)
url='https://balancedannihilation.com/'
license=('GPL' 'CCPL' 'custom:non-free')
depends=('spring')
source=("https://github.com/Balanced-Annihilation/Balanced-Annihilation/releases/download/VERSION%7Bv${pkgver}%7D/balanced_annihilation-v$pkgver.sdz"
	'license-non-free')
noextract=("balanced_annihilation-v$pkgver.sdz")
md5sums=('32c019d63c0104be760e76b6aa9f4ca3'
         '28872feaac21fc4b2b4ae00b3f86e52a')

PKGEXT='.pkg.tar'

package() {
	install -Dm644 balanced_annihilation-v$pkgver.sdz \
			"$pkgdir/usr/share/spring/games/balanced_annihilation-v$pkgver.sdz"
	install -Dm644 license-non-free "$pkgdir/usr/share/licenses/$pkgname/non-free"
}
