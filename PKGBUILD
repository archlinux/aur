# Maintainer: arjan5 <aur@anymore.nl>

pkgname=qubes-usb-proxy
pkgver=1.0.17
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64" "i686")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha256sums=('177592ae51be9d23551d2c40ad20b4cacaddcc929d55a8e4bb8781614b9c0b3b')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
