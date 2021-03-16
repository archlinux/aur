# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.1.3
pkgrel=1
pkgdesc="boot environment manager for ZFS"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'awk' 'sed' 'grep' 'zfs-utils' 'sh')
optdepends=('grub: select boot environment at boot')
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
md5sums=('2601accb321cd5fb72a1f2e4f9fe0ce5')
