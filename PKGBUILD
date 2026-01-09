# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher
pkgver=0.2.1
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Kasui92/lancher"
license=('MIT')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('e379d85d3473476e6e8a79a3fa644b8c053e822297b8f27a1a9d97bb86e8bab1')
sha256sums_aarch64=('2f08b9bec9edf821d479fef439ec1e6b4293d194ac88d2710346a1adec1845c3')

package() {
  # install the binary
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
