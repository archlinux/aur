# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-bangers
pkgver=1.0
pkgrel=1
pkgdesc='Comic books font with capital letters'
arch=(any)
url="https://fonts.google.com/specimen/Bangers"
license=(OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Bangers")
sha256sums=('76f27ee3b9f2a9f28236ef05d867c141b2574e1b23c2ae568e7c05a06e0634a3')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" Bangers-Regular.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
