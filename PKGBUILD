# Maintainer: Stefan Damm <autama at nurfuerspam.de>
# Contributor: Igor Scabini <furester at gmail dot com>

pkgname=neotool
pkgver=1.3
pkgrel=3
pkgdesc="Provide a friendly GUI frontend to some common management tasks for Openmoko smartphones."
arch=('i686' 'x86_64')
url="http://wiki.openmoko.org/wiki/NeoTool"
license=('GPL')
depends=('libusb' 'dfu-util' 'zenity')
makedepends=()
provides=()
install=

source=('http://users.on.net/~antisol/neotool')
md5sums=('fe9361a3d42142adc54e9137cb7af6ac')
package() {
   cd "$srcdir"
   install -D -m755 neotool "$pkgdir/usr/bin/neotool"
}
