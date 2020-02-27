# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-boogaloo
pkgver=1.002
pkgrel=2
pkgdesc='Font reminding of the 1960s Latin music'
arch=(any)
url="https://fonts.google.com/specimen/Boogaloo"
license=(OFL)
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Boogaloo")
sha256sums=('244a357fbfaf6401e6c4e1de94ffc9ee7f6bd2ef2fc0b70b0dc301a8e60220f4')

package() {
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" Boogaloo-Regular.ttf
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
