# Maintainer: bugra9 <bugra9@gmail.com>

pkgname=bootableusb
pkgver=0.3
pkgrel=1
pkgdesc="Create bootable usb drives"
arch=('i686' 'x86_64')
url="https://github.com/bugra9/BootableUSB"
license=('GPL3')
groups=()
depends=()
makedepends=()
optdepends=()
source=("bootableusb::git+https://github.com/bugra9/BootableUSB.git")
md5sums=('SKIP')

build() {
        cd bootableusb
        make
}

package() {
        cd bootableusb
        make DESTDIR="$pkgdir" install
}