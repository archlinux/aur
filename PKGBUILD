# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.17"
pkgrel=1
pkgdesc="boot environment manager for ZFS"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'awk' 'sed' 'grep' 'zfs-utils' 'sh' 'grub')
install="${pkgname}.install"
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
sha256sums=('2d37b0fc9f34948f98188743436dc8a7d3722bd4fed55e40c76ee40c09b991b0')
