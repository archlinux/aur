# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs-bin
_name=cork
pkgver=0.2.1
pkgrel=1
pkgdesc="A command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_name"
        "README-$pkgver.md::https://raw.githubusercontent.com/reddocmd/$_name/v$pkgver/README.md")
sha256sums=('d648b997c84cd676174a1750aa56a6810e64fa290cd5495a7e1f27d9c8756a7f'
            'cf19d9ec490b2591bbd084c29459af31c6a06a696fecf60630fdf4c097a648c9')

package() {
  install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/$_name"
  install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
