# Maintainer: Daniel Langbein <daniel@systemli.org>
pkgname="toggle-bluetooth"
pkgver=0.0.1
pkgrel=1
pkgdesc="Script to toggle bluetooth on/off"
arch=('any')
license=('MIT')
depends=('bluez-utils' 'libnotify')
makedepends=('make')
source=('Makefile' 'toggle-bluetooth.sh')
sha256sums=('5c0d84735779e0ae3685ccca9a8750a01adf3af74889e14c0af19150394cbc04'
            'e6d8c87b23ddce9c0d57c1b3ba55b240ff6658b4acbd982029cad655c2e14d1e')

package() {
  make DESTDIR="$pkgdir/" PKGNAME="$pkgname" install
}
