# Maintainer: Daniel Langbein <daniel@systemli.org>
pkgname="toggle-bluetooth"
pkgver=0.0.2
pkgrel=1
pkgdesc="Script to toggle bluetooth on/off"
arch=('any')
license=('MIT')
depends=('bluez-utils' 'libnotify')
makedepends=('make')
source=('Makefile' 'toggle-bluetooth.sh')
sha256sums=('e302f0582ce78eeb6d804505e7eb811ff2b64171a6b69408e76788e67f83c05e'
            'e6d8c87b23ddce9c0d57c1b3ba55b240ff6658b4acbd982029cad655c2e14d1e')

package() {
  make DESTDIR="$pkgdir/" PKGNAME="$pkgname" install
}
