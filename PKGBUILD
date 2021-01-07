# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.19
pkgrel=1
pkgdesc="Shell script ZFS boot environment manager"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils')
optdepends=('grub: select boot environment at boot')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
md5sums=('c4976c5ba67b1aa8bb6beda18f40219b')
