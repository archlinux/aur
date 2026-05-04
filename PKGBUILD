# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Paris Atticus Keech Doherty <Paris.Doherty@icloud.com>
pkgname=ttf-junimoalphabet
pkgdesc="TrueType font for the Junimo language from Stardew Valley"
pkgver=1
pkgrel=1
pkgwhole=$pkgname-$pkgver-$pkgrel.ttf
arch=(any)
url="https://2ttf.com/AlwrCyFmXuC"
license=('CC0-1.0')
source=("$pkgname-$pkgver-$pkgrel.ttf"::"https://raw.githubusercontent.com/paris1111q1q1q1/StardewValley_JunimoFont/refs/heads/main/junimoalphabet.ttf"
	"LICENSE"::"https://raw.githubusercontent.com/paris1111q1q1q1/StardewValley_JunimoFont/refs/heads/main/LICENCE")
sha256sums=('12fb77d0884271ff76c7d19da18f2e1d4c7fcf66ed32103a971b4432ffc0ee7c'
            '03697f286d2343ed77feeef34bc3c0eb2e0ec845dae86f7020ad0a092d0aea0c')
package() {
  install -Dm644 $pkgwhole "$pkgdir/usr/share/fonts/StardewFonts/$pkgwhole"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
