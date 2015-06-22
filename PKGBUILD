# Maintainer: Malte Bublitz <malte70+aur@mcbx.de>

pkgname=archlinux-static-ip
pkgver=0.0.1
pkgrel=1
pkgdesc="Make ArchLinux ready for a static IP setup"
arch=(any)
url="https://github.com/malte70/archlinux-static-ip"
license=("MIT")
depends=("bash")
source=("$pkgname-$pkgver.tar.gz::https://github.com/malte70/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4c6066b6b1ee20ad06504acd995193253e1d6feebb5a1c50b49cb7060b2741d7')

package() {
	cd "${srcdir}/$pkgname-${pkgver}"
	env PREFIX=$pkgdir install.sh
}
