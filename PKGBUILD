# Maintainer: Paris Atticus Keech Doherty <Paris.Doherty@icloud.com>
pkgname=ttf-junimoalphabet
pkgdesc="TrueType font for the Junimo language from Stardew Valley"
pkgver=1
pkgrel=1
pkgwhole=$pkgname-$pkgver-$pkgrel.ttf
arch=(any)
url="https://2ttf.com/AlwrCyFmXuC"
license=('CC0-1.0')
source=("$pkgname-$pkgver-$pkgrel.ttf"::"https://raw.githubusercontent.com/paris1111q1q1q1/StardewValley_JunimoFont/refs/heads/main/junimoalphabet.ttf")
sha256sums=('12fb77d0884271ff76c7d19da18f2e1d4c7fcf66ed32103a971b4432ffc0ee7c')
package() {
  install -Dm644 $pkgwhole "$pkgdir/usr/share/fonts/StardewFonts/$pkgwhole"
}
