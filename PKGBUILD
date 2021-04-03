# Maintainer: SanskritFritz (gmail)

pkgname=celestia-addon-star_destroyer
pkgver=1
pkgrel=2
pkgdesc="Celestia addon: Fictional: Star Wars: Star Destroyer"
arch=('any')
url='https://www.celestiamotherlode.net/addon/addon_162.html'
license=('unknown')
depends=('celestia' 'celestia-addon-tatooine_endor_deathstar')
makedepends=('unzip')
conflicts=('celestia-addon-star-destroyer')
source=('https://celestiamotherlode.net/creators/jestr/SW-StarDestroyer(big).zip')

package() {
	mkdir --parents "$pkgdir/usr/share/celestia/extras"
	cp --recursive "$srcdir/SW-StarDestroyer(big)/" "$pkgdir/usr/share/celestia/extras/"
}

md5sums=('670ea607572cc9335bd3cfa7f10aabf8')
