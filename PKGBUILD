# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-passwd
pkgver=0.2.0
pkgrel=2
pkgdesc='Set password for main system inside initrd'
arch=('any')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-passwd'
license=('GPL')
install=mkinitcpio-passwd.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-passwd.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd mkinitcpio-passwd/

	make DESTDIR="${pkgdir}" install
}

