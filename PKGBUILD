# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-hostname
pkgver=0.2.2
pkgrel=1
pkgdesc='Set hostname for main system inside initrd'
arch=('any')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-hostname'
license=('GPL')
install=mkinitcpio-hostname.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-hostname.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd mkinitcpio-hostname/

	make DESTDIR="${pkgdir}" install
}

