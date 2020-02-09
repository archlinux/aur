# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=gamepad-tool-bin
pkgver=1.2
pkgrel=1
pkgdesc='Simple GUI tool to create/modify gamepad mappings for SDL2 Game Controller API'
arch=(x86_64)
url="http://www.generalarcade.com/gamepadtool"
license=(unknown) # nonfree
depends=(sdl2 qt5-base) # from namcap
source=("$url/linux/gamepad-tool-amd64_$pkgver.zip")
sha256sums=('d699f39212ec8a5ee88f9c012ce9d2ee40591abdba8797fb9d758765a45e0340')

package() {
	install -Dm755 bin/gamepad-tool -t "$pkgdir/usr/bin"
}
