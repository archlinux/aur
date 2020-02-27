# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-buenard
pkgver=1.002
pkgrel=2
pkgdesc='Classic serif font for art books by Gustavo Ibarra'
arch=(any)
url="https://fonts.google.com/specimen/Buenard"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Buenard")
sha256sums=('4b17e784f85540993a8b3c553c031bc9b4347af86c3a73c352874855dd08b0ba')

package() {
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
