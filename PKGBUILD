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
	"LICENSE"::"https://github.com/paris1111q1q1q1/StardewValley_JunimoFont/blob/58e82e4336e643ca06e95372149aef267951302a/LICENCE")
sha256sums=('12fb77d0884271ff76c7d19da18f2e1d4c7fcf66ed32103a971b4432ffc0ee7c'
            'f895ad3412359a613ec1c52f4316185956066c7eb46242ae3333a1d577494584')
package() {
  install -Dm644 $pkgwhole "$pkgdir/usr/share/fonts/StardewFonts/$pkgwhole"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
