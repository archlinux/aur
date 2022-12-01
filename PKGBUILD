# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-randommac
pkgver=0.2.0
pkgrel=2
pkgdesc='Initialize network device with random mac address'
arch=('any')
depends=('macchanger')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-randommac'
license=('GPL')
install=mkinitcpio-randommac.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-randommac.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd mkinitcpio-randommac/

	make DESTDIR="${pkgdir}" install
}

