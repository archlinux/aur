# Maintainer: Jonas Riedel <jonasriedel@pm.me>

pkgname=hue-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="A description of your package."
arch=('x86_64')
url="https://github.com/jonasrdl/hue-cli"
license=('MIT')
depends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # You can generate this using `updpkgsums` later

build() {
  cd "$pkgname-$pkgver"
  go build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
