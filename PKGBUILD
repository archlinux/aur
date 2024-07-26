# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("sand")
pkgver=0.1.4
pkgrel=1
pkgdesc="Sand is an engaging and interactive terminal physics sandbox"
url="https://github.com/mbwilding/sand"
license=("MIT")
arch=("x86_64")
source=("https://github.com/mbwilding/sand/releases/download/v$pkgver/sand-Linux-x86_64-musl.tar.gz
")
sha256sums=('56418403e5854fabe4d81cf0c465a96c195c193a5014961037f18e4c8c757133')

package() {
  install -Dm755 "$srcdir/sand" "$pkgdir/usr/bin/sand"
}
