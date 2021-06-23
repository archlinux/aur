# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver="0.2.27"
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
sha256sums=('5ea5ca56066c1d7a283fa9d1aead3ceda6cd1e94e50329d3d646f56a375dc907')
