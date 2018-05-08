# Maintainer: arjan5 <aur@anymore.nl>

pkgname=qubes-usb-proxy
pkgver=1.0.18
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64" "i686")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha256sums=('5e7107810301e949acd2e5204cf12320e73a792b77d420f0f22b6f26b72c992f')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
