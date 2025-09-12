# Maintainer: ayu2805

pkgname=uct
pkgver=2
pkgrel=1
arch=(any)
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=uct"
depends=(clang java-environment python)
source=("uct")
sha256sums=(c682b8d3ecd98a25322c580c6f9ca27dea24246e970a2134db92414de21e2c34)

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
