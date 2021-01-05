# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.13
pkgrel=1
pkgdesc="Pure shell script Root on ZFS boot environment manager with GRUB integration for Linux"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'util-linux' 'zfs')
optdepends=('grub: select boot environment at boot')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
vaildpgpkeys=("A88D6A755BBB263C")
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
md5sums=('09770649f15140b00f59cd04135a830e')
