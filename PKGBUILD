# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-archlogo
pkgver=0.3.1
pkgrel=1
pkgdesc='Add colored Arch Linux ASCII art logo to early boot process'
arch=('any')
url='https://github.com/eworm-de/mkinitcpio-archlogo'
depends=('mkinitcpio')
makedepends=('git')
license=('GPL')
install=mkinitcpio-archlogo.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-archlogo.git#tag=${pkgver}?signed")
backup=('etc/archlogo.conf')
sha256sums=('SKIP')

package() {
	cd mkinitcpio-archlogo/

	make DESTDIR="${pkgdir}" install
}

