# Maintainer: jackssrt <jack at jackssrt dot com>
pkgname="loago-bin"
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Track how long ago you last did a task"
arch=("x86_64")
url="https://github.com/Axlefublr/loago"
license=("MIT")
depends=(gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=("loago")
conflicts=("loago")

source=("$pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/$pkgver/loago-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=("2348194e5f0346979b1ff25aa9d60510ea82bf722f8fea5efbc561a557ba5084")

package() {
	install -Dm0755 "$srcdir/loago" "$pkgdir/usr/bin/loago"
}
