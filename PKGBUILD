# flashpoint-launcher-bin

# Maintainer: LeSnake <dev.lesnake@posteo.de>

pkgname=bibox2-bin
pkgver=2.4.12
pkgrel=1
pkgdesc="Offizieller Client für Westermann Schulbücher / Official Client for school books by Westermann"
arch=('x86_64')
url="https://www.bibox.schule"
license=('custom')
depends=('org.freedesktop.secrets' 'gtk3' 'ffmpeg' 'pango' 'xorg-xrandr')
makedepends=('tar')
provides=('bibox2')
optdepends=()
conflicts=()
source=("https://static.bibox2.westermann.de/electron/autoUpdate/BiBox%202.0%202.4.12.deb")
sha512sums=('643204267be79fd60b55558e706db9b92a30ebef6c5500708320bdaae134a35461e5bec37eacb0c7d0bedf3a4a78370427ce40663f45344441f9dfb7fd01e939')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	mv "${pkgdir}"/usr/share/applications/electron.desktop "${pkgdir}"/usr/share/applications/Bibox2.desktop
}
