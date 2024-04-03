# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-andada
pkgver=3.003
pkgrel=1
pkgdesc='Organic-slab serif font made for Guaraní and Spanish'
arch=(any)
url="https://andada.huertatipografica.com/"
license=(OFL-1.1-no-RFN)
source=("git+https://github.com/huertatipografica/Andada-Pro#commit=74ef333d959f5da6a04e6613446d25c2ecffb9f6")
sha256sums=('71f607d94e3704be9686f18fbcf210efad06c06b37c20f405a15460c297cd8dc')

package() {
	cd Andada-Pro
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" fonts/ttf/*.ttf
}

