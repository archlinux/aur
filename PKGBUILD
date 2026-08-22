# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=exif420
pkgver=2.0
pkgrel=1
pkgdesc="The Simple, lightweight, & fast EXIF Reader Library for C++"
arch=('x86_64')
url="https://github.com/Jeyers-Development/exif420"
license=('MIT')
depends=('glibc')
source=("$url/releases/download/v$pkgver/libexif420.so")
options=('!debug' '!strip')
sha256sums=('e0db0b2170d1116bf2db9e82cf2ab59e3ad02a311a04ecc56960ed9fd028b48c')

package() {
    install -Dm755 "$srcdir/libexif420.so" "$pkgdir/usr/lib/libexif420.so"
}
