# Maintainer: Daniel Langbein <daniel@systemli.org>
pkgname="toggle-bluetooth"
pkgver=0.0.2
pkgrel=3
pkgdesc="Script to toggle bluetooth on/off"
arch=('any')
license=('MIT')
depends=('bluez-utils' 'libnotify')
makedepends=('make')
source=('Makefile' 'toggle-bluetooth.sh')
sha256sums=('392eb5d7a4e690baf2fb34f6a1a6bba802b634c0b8f67e4dda78da5910bc8eaa'
            'e4198885ebaf9c7bf74ae6731238fd69341a866f2b172b75b52dd7694004eaef')

package() {
  make DESTDIR="$pkgdir/" PKGNAME="$pkgname" install
}
