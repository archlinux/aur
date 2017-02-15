# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
pkgname=netctl-auto-resume
pkgver=1
pkgrel=1
pkgdesc="netctl-auto-resume@ systemd service, to reconnect when the system resumes from suspend"
arch=('any')
url="https://wiki.archlinux.org/index.php/Netctl"
license=('MIT')
depends=('netctl')
source=("netctl-auto-resume@.service")
md5sums=('4b0ac8a2bc46554b7108508bde854dd1')

package() {
	cd "$srcdir"
	install -Dm755 netctl-auto-resume@.service "$pkgdir/etc/systemd/system/netctl-auto-resume@.service"
}
