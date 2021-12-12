# Maintainer: Otto Sabart <aur@seberm.com>

pkgname=qubes-pass
pkgver=0.0.24
pkgrel=1
pkgdesc="An inter-VM password manager for Qubes OS "
arch=("x86_64" "i686")
url="https://github.com/Rudd-O/qubes-pass"
license=('GPL3')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make)

source=(https://github.com/Rudd-O/qubes-pass/archive/v${pkgver}.tar.gz)
sha256sums=('c0ecae5b7361ae471ebc07946629f124aa0ea261f934146a2b838214b87a92cc')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${_srcname}/"
    make install-client DESTDIR="$pkgdir"
}

