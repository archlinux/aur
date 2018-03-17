# Maintainer: Tyler Dence <tyzoid@archlinux32.org>

pkgname=ttf-crewniverse
pkgver=0.5
pkgrel=1
pkgdesc="Crewniverse is a font that replicates the one used for the title cards of the TV show Steven Universe(tm), as well as the logo of the Steven Crewniverse's Tumblr (hence the name, originally)."
arch=('any')
url="https://www.deviantart.com/art/Crewniverse-Font-V-5-MORE-ACCENTS-AND-SYMBOLS-540122768"
license=('Unknown proprietary')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("https://dl.tyzoid.com/arch/package-dl/$pkgname-v$pkgver.tar.gz")
sha512sums=('9adfe3224b89ee5f0b70a0b0048b1b8c7845cdbcf412bce17ee9c3049df0e3bedfeb81f41bc217ae657a578b3f4bc2e01d9676332ee062884b56d78a0b67b170')

package() {
	install -d $pkgdir/usr/share/fonts/TTF/ 
	install -Dm644 "$srcdir/$pkgname-v$pkgver/crewniverse_font.ttf" "$pkgdir/usr/share/fonts/TTF/Crewniverse.ttf"
}
