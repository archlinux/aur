# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cork-rs-bin
_name=cork
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_name"
        "README-$pkgver.md::https://raw.githubusercontent.com/reddocmd/$_name/v$pkgver/README.md")
sha256sums=('c1f2404b3b6e31f07feeba057af90de186e589077f64ac5d913ec5642c7ab8ea'
            '763472db689d0c8084a6275b3ad3e1a631ffe67e74c4cfb5919925582e64ba06')

package() {
  install -Dvm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_name"
  install -Dvm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

