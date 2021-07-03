# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.29"
pkgrel=1
pkgdesc="boot environment manager for ZFS"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPLv3+')
depends=('coreutils' 'awk' 'sed' 'grep' 'sh' 'grub')
#backup=('etc/bieaz.cfg' )
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
sha256sums=('86b2dfd20578233293f59a82ed53ddec7dbaa3cef611ecfd2d158b40a5d991d3')
