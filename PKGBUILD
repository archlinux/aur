# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=poop
pkgver=0.4.0
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/andrewrk/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$pkgname")
sha256sums=('SKIP')

package() {
	install -Dm755 "$CARCH-linux-$pkgname" "$pkgdir/usr/bin/$pkgname"
}
