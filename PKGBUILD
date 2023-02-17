# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=helixbinhx
pkgver=1
pkgrel=1
pkgdesc='Link /usr/bin/hx to helix'
arch=(any)
license=('GPL')
depends=()
conflicts=(hex)
source=()
sha256sums=()

package() {
	depends+=(helix)
	install -dm755 "$pkgdir/usr/bin"
	ln -s helix "$pkgdir/usr/bin/hx"
}
