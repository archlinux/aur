# Maintainer: Otto Sabart <aur@seberm.com>

pkgname=qubes-pass
pkgver=0.0.30
pkgrel=1
pkgdesc="An inter-VM password manager for Qubes OS "
arch=("x86_64" "i686")
url="https://github.com/Rudd-O/qubes-pass"
license=('GPL3')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make)

source=(https://github.com/Rudd-O/qubes-pass/archive/v${pkgver}.tar.gz)
sha256sums=('d4854b8262a71d446de88b8863fa20eb513bf98977cbf7d604d4bd33669cd014')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${_srcname}/"
    make install-client DESTDIR="$pkgdir"
}

