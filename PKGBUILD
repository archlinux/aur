# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.15
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
md5sums=('a994c3dcc76d567c63fe6c1c9bff34a1')
