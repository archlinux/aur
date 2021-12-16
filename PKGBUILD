# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/cork"
        "README-$pkgver.md::$url/raw/v$pkgver/README.md")
sha256sums=('665cb04374978a201e2c7e0185e0f577ac34b08f4b40f9e46da5df3661a89cde'
            '6803933b44d443b20f00af11f30615da6853769abc28ba459c50af9eeaa77860')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/cork"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
