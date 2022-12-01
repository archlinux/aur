# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-chkeymap
pkgver=0.2.0
pkgrel=2
pkgdesc='Set keymap and timezone for main system inside initrd'
arch=('any')
depends=('terminus-font')
makedepends=('git')
url='https://github.com/eworm-de/mkinitcpio-chkeymap'
license=('GPL')
install=mkinitcpio-chkeymap.install
backup=('etc/vconsole.conf'
	'etc/X11/xorg.conf.d/00-keyboard.conf')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("git+https://github.com/eworm-de/mkinitcpio-chkeymap.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd mkinitcpio-chkeymap/

	make DESTDIR="${pkgdir}" install
}

