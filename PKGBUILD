# Maintainer: Daniel Langbein <daniel@systemli.org>
pkgname="toggle-bluetooth"
pkgver=0.0.2
pkgrel=4
pkgdesc="Script to toggle bluetooth on/off"
arch=('any')
license=('MIT')
depends=('bluez-utils' 'libnotify')
makedepends=('make')
source=('Makefile' 'toggle-bluetooth.sh')
sha256sums=('307770640467f3f7b4bdd7b02a6be792de9700b20590596519165511af9d9ad3'
            'e4198885ebaf9c7bf74ae6731238fd69341a866f2b172b75b52dd7694004eaef')

package() {
  make DESTDIR="$pkgdir/" PKGNAME="$pkgname" install
}
