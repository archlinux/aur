# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=2048.zig
_pkgname=${pkgname%.zig}
pkgver=0.1.2
pkgrel=1
pkgdesc="2048 in zig"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ratakor/$pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("_$pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname")
sha256sums=('SKIP')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
