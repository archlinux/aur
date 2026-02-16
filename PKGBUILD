# Maintainer: Kasui92 <me@lucapattocchio.dev>
pkgname=lancher
pkgver=0.2.5
pkgrel=1
pkgdesc="A minimal, local project-template manager written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/lancher-dev/lancher"
license=('MIT')
depends=('glibc')
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$pkgname-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$pkgname-linux-arm64")
sha256sums_x86_64=('3e71de11382deb291c3d60141d0357e7e428ff3e8c3e99e14bc86293da8cbf01')
sha256sums_aarch64=('b7479fded44b28eaf7a03c6544675cff4386537adc0f9dd7f7a9213e619d1785')

package() {
  # install the binary
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$pkgname"
}
