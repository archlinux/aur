# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=2048.zig-bin
_pkgname=${pkgname%.zig-bin}
pkgver=0.2.3
pkgrel=1
pkgdesc="2048 made in zig"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ratakor/${pkgname%-bin}"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname")
sha256sums=('SKIP')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
