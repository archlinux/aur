# Maintainer: ayu2805

pkgname=uct
pkgver=1
pkgrel=1
arch=(any)
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=uct"
depends=(clang java-environment python)
source=("uct")
sha256sums=(ddf518b30d77168239144dacf75b9e5082102891b13915ee8e8f3f6f8130b98e)

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
