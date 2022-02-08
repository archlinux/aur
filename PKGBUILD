# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs-bin
pkgver=0.2.3
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
sha256sums=('6a410a7011a2a78175d8d9a594e4c69371af1ee73706eaa16a144d8644b74ddd'
            'c5b5545196834d3c05f876df9c381882fff810f2786d4175f5f6e79e400904d9')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/cork"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
