# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=osccli
pkgver=0.1
pkgrel=2
pkgdesc="Fast and simple cli tool for Open Sound Control communication, written in Rust"
arch=('x86_64')
url="https://github.com/madskjeldgaard/osccli"
license=('GPL')
groups=('pro-audio')
depends=()
makedepends=()
source=("https://github.com/madskjeldgaard/osccli/releases/download/v$pkgver/osccli-linux-$arch-v$pkgver.zip")
sha256sums=("SKIP")

package() {
	install -Dm755 "$srcdir/osccli" "$pkgdir/usr/bin/$pkgname"
}
