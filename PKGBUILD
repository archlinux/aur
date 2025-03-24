# Maintainer: Raimar Bühmann <raimar_at_buehmann dot de>

pkgname=elitech-udev
pkgver=1.0.0
pkgrel=2
pkgdesc='Udev rules to allow Elitech devices by group'
arch=('any')
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=elitech-udev"
license=('GPL-3.0')
depends=(
	'udev'
)
source=(
	60-elitech.rules
	elitech-udev.conf 
	elitech-udev.install
)
sha256sums=('5707a2dd0f52215c05440e1836e58d29193d39293c7574b9fe1e1343a46e08ad'
            '3e748cb59c05b9391149ae890acf30898aa7b0fb3c16f571c371109d23621806'
            '74ffdfd5b914bb47660e17b9cc7ae735e6011ff2d41f55db75bd65974df2c923')
install=$pkgname.install
package() {
	install -Dm 644 60-elitech.rules "$pkgdir/usr/lib/udev/rules.d/60-elitech.rules"
	install -Dm 644 elitech-udev.conf "$pkgdir/usr/lib/sysusers.d/elitech-udev.conf"
}

