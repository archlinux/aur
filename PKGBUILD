# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher
pkgver=0.3.0
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/lancher-dev/lancher"
license=('MIT')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('db2fe3571b00f2f86428c054aef7a401ace34092359b638b31a345cda975af9f')
sha256sums_aarch64=('2d768b7952720d9bdad0276e3150611e7951d65e7f89f48f713752c409b6327b')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
