# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.3.0"
pkgrel=1
pkgdesc="boot environment manager"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPLv3+')
depends=('coreutils' 'awk' 'sed' 'grep' 'sh' 'grub')
backup=('etc/bieaz.cfg' )
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
sha256sums=('cc23b6a4e695a74b66c0f8f05bc21343f8a7687adbc62cb1c718366fcf44eea6')
