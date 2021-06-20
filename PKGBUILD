# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.25"
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
sha256sums=('b5f269534be0ddea3726a9572ee1e8fa53cf3899641c195620ac34c3fe987983')
