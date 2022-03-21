# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=grub-reboot-poweroff
pkgver=0.2.1
pkgrel=2
pkgdesc='Reboot and Poweroff system from Grub boot menu'
arch=('any')
url='https://github.com/eworm-de/grub-reboot-poweroff'
license=('GPL')
depends=('grub')
makedepends=('git')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/grub-reboot-poweroff.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd grub-reboot-poweroff/

	make DESTDIR="${pkgdir}" install
}

