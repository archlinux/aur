# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.3.1"
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
sha256sums=('0c171e4e9a35e092d44ef7b4327703c8175e2ebad5aec873055d3e6101dccd71')
