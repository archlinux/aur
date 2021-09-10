# Contributor: Athemis <athemis@ish.de>
# Contributor: ReNoM <renom [at] list [dot] ru>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=spring-ba
pkgver=14.0.1
pkgrel=1
pkgdesc='A fan mod of Total Annihilation with remastered graphics and balance'
arch=(any)
url='https://balancedannihilation.com/'
license=('GPL' 'CCPL' 'custom:non-free')
depends=('spring')
source=("https://www.springfightclub.com/data/balanced_annihilation-v$pkgver.sdz"
	'license-non-free')
noextract=("balanced_annihilation-v$pkgver.sdz")
md5sums=('196811a65aee80f1c88b4fd76baa3898'
         '28872feaac21fc4b2b4ae00b3f86e52a')

PKGEXT='.pkg.tar'

package() {
	install -Dm644 balanced_annihilation-v$pkgver.sdz "$pkgdir/usr/share/spring/games/balanced_annihilation-v$pkgver.sdz"
	install -Dm644 license-non-free "$pkgdir/usr/share/licenses/$pkgname/non-free"
}
