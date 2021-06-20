# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.22"
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
sha256sums=('37405004abc6ce834b6552a43d1dab3b2ece8f77d253a06bb4bf852a886511ff')
