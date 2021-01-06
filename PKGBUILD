# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.18
pkgrel=1
pkgdesc="Shell script ZFS boot environment manager"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'util-linux')
optdepends=('grub: select boot environment at boot')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
md5sums=('fa10cbfb4a5caed007e919fdc24a64f6')
