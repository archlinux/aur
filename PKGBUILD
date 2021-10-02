# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs-bin
_name=cork
pkgver=0.2.0
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
sha256sums=('60a4ce2021ea32ee0c0649b136d17769ffeedb90f57fccf25e23f01f04d9b360'
            'cf19d9ec490b2591bbd084c29459af31c6a06a696fecf60630fdf4c097a648c9')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_name"
  install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
