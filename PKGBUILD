# Maintainer: Otto Sabart <aur@seberm.com>

pkgname=qubes-pass
pkgver=0.1.0
pkgrel=1
pkgdesc="An inter-VM password manager for Qubes OS "
arch=("x86_64" "i686")
url="https://github.com/Rudd-O/qubes-pass"
license=('GPL3')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make)

source=(https://github.com/Rudd-O/qubes-pass/archive/v${pkgver}.tar.gz)
sha256sums=('971354426845906e17a33531bf5af308144a57692500fb4c8387edc74db79b8e')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${_srcname}/"
    make install-client DESTDIR="$pkgdir"
}

