# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs-bin
pkgver=0.2.4
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
sha256sums=('ea36d6bebe2b68cd6824929d1bc5e77797978e086bd1ef5e0af038814c264e16'
            'c5b5545196834d3c05f876df9c381882fff810f2786d4175f5f6e79e400904d9')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/cork"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
