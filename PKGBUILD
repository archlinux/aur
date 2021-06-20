# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.21"
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
sha256sums=('4cfba08452ee7a6327d8af616a1d675f198bf3c571364b540df6b7932fd613f6')
