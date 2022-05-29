# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=2
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"

source=('nvidia-modprobe.service')
sha512sums=('8611a7be31a75fc8794c2e5c2f74678da82893fb42387d2e94ad877276939975ccf8daaa32aa3f84bafd40501a8216ea436ea0010ede3e958f910804ae3c36d8')

package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
