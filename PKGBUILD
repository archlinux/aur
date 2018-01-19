# Maintainer: arjan5 <aur@anymore.nl>

pkgname=qubes-usb-proxy
pkgver=1.0.14
pkgrel=1
pkgdesc="The Qubes service for proxying USB devices"
arch=("x86_64" "i686")
url="https://qubes-os.org"
license=('GPL')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make gcc)

source=(https://github.com/QubesOS/qubes-app-linux-usb-proxy/archive/v${pkgver}.tar.gz)
sha256sums=('0c1729763b5409b165dd9b408e3551948c63b04e80450a99d439cdcd7c4e9da8')

_srcname=qubes-app-linux-usb-proxy-${pkgver}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir
}
