# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pacman-offline
pkgver=0.0.2
pkgrel=1
pkgdesc='offline system update with pacman'
arch=('any')
url='https://github.com/eworm-de/pacman-offline'
license=('GPL')
depends=('systemd' 'pacman')
makedepends=('git' 'markdown')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('e737fbee142cb785ec2a228084e60c729e0c4cd2695182dde0d88e19da9fdc05'
            'SKIP')

package() {
	cd "pacman-offline-${pkgver}/"

	make DESTDIR=${pkgdir} install
}

