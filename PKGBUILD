# Maintainer: Paris Atticus Keach Doherty <Paris.Doherty@icloud.com>
pkgname=otf-stardew-valley
pkgver=1
pkgrel=1
pkgdesc="This OpenType Font is a Stardew Valley Font recreated by RRDome"
arch=(any)
url="https://fontstruct.com/fontstructions/show/1254619/stardew_valley"
license=('custom')
source=("$pkgname-$pkgver.otf"::"https://raw.githubusercontent.com/paris1111q1q1q1/StardewValley_Font/refs/heads/main/stardew-valley.otf"
	"LICENSE"::"https://raw.githubusercontent.com/paris1111q1q1q1/StardewValley_Font/refs/heads/main/LICENCE")
sha256sums=('47a1b9d80fd17c486021fa43400a2d24cf7d9aae555189c0ce6d60418c24560d'
            'de01e436d6c1cb001a503967bb6669d18c5ec3e7d2f4944d7ed6036584c760bd')
Fullpkgname=$pkgname-$pkgver.otf
package() {
	install -Dm644 $Fullpkgname "$pkgdir/usr/share/fonts/StardewFonts/$Fullpkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
