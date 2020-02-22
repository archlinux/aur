# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-fenix
pkgver=1.001
pkgrel=1
pkgdesc='Serif font designed for display and long texts'
arch=(any)
url="https://tipotype.com/underground/fenix/"
license=(OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Fenix")
sha256sums=('7dc101548d385cbf51a5c6103e431f3e81deb57b790ea443abc75c1b4b7c37b0')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
