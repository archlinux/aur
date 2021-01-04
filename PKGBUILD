# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.9
pkgrel=1
pkgdesc="Pure shell script Root on ZFS boot environment manager with GRUB integration for Linux"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils' 'util-linux' 'zfs')
optdepends=('grub: select boot environment at boot')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
	make DESTDIR="$pkgdir/" install
}
md5sums=('e2d4f1dee353861dea389d8d77a6569b')
