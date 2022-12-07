# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-uname
pkgver=0.2.2
pkgrel=1
pkgdesc='Add uname output to early boot process'
arch=('any')
url='https://github.com/eworm-de/mkinitcpio-uname'
makedepends=('git')
license=('GPL')
install=mkinitcpio-uname.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-uname.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd mkinitcpio-uname/

	make DESTDIR="${pkgdir}" install
}

