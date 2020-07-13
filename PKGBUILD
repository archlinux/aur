# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-andada
pkgver=1
pkgrel=1
pkgdesc='Organic-slab serif font made for Guaraní and Spanish'
arch=(any)
url="https://andada.huertatipografica.com/"
license=('OFL')
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Andada")
sha256sums=('ca5fccc8c09ff8cc2f5053099ce87b711e54fb771cf5127cada825b2eaa63794')

package() {
	cd "$srcdir"
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" Andada-Regular.ttf
}

