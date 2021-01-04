# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.12
pkgrel=1
pkgdesc="Pure shell script Root on ZFS boot environment manager with GRUB integration for Linux"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'util-linux' 'zfs')
optdepends=('grub: select boot environment at boot')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('fa773ed373bd6ef81afd258a9d5be7cd')
