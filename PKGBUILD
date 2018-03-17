# Maintainer: Tyler Dence <tyzoid@archlinux32.org>

pkgname=ttf-crystal-universe
pkgver=1.0
pkgrel=1
pkgdesc="A recreation of the Steven Universe logotype."
arch=('any')
url="https://maxigamer.deviantart.com/art/Crystal-Universe-FONT-580280358"
license=('Unknown proprietary')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("https://dl.tyzoid.com/arch/package-dl/$pkgname-$pkgver.tar.gz")
sha512sums=('ceb8a93b7602e362f544912332ab7601d81096b7020d42444e85859633bcdec154d35ff68194860feaa936e47ccb14599f04b901e93b22ee39112de604d2bb4b')

package() {
	install -d $pkgdir/usr/share/fonts/TTF/ 
	install -Dm644 "$srcdir/$pkgname-$pkgver/"*.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
