# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher
pkgver=0.1.4
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Kasui92/lancher"
license=('MIT')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('f01cc6396733400758a68f7ca6a30b6e16b4fe6cec0f37d6185f160bfbef9925')
sha256sums_aarch64=('59289fa66b3cbad6ab35ab59247e3b9140dd1e83f698e2bd0b82abd212192187')

package() {
  # install the binary
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
