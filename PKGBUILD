# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=disfetch
pkgver=2.3
pkgrel=1
pkgdesc='Yet another *nix distro fetching program, but less complex.'
arch=('any')
url="https://github.com/llathasa-veleth/$pkgname"
license=('MIT')
makedepends=('binutils')
depends=('bash>=4.0.0')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d31e5304af7e35969dd138bb957d3ffcc71c8b1639cd1ad6d4a1c6b1ca0f3706')

package() {
	cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
