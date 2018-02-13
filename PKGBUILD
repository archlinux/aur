# Maintainer: arjan5 <aur@anymore.nl>

pkgname=qubes-usb-proxy
pkgver=1.0.16
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64" "i686")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha256sums=('1b3e811a99a15e8354cc04dc2afb7d3a889b851641001152bec15798c254e637')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
