# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Kasui92/lancher"
license=('MIT')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('768af0e6b5fa58bf5b874834bab631ec635783e471545c8af73b15ad272eaf39')
sha256sums_aarch64=('8bc47d92175b0abf03bdd4e72c6930189218a2ffeb42252bbeed10f738470a63')

package() {
  # install the binary
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
