# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=poop-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.0
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/andrewrk/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname")
sha256sums=('SKIP')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
