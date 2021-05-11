# Maintainer: Otto Sabart <aur@seberm.com>

pkgname=qubes-pass
pkgver=0.0.23
pkgrel=1
pkgdesc="An inter-VM password manager for Qubes OS "
arch=("x86_64" "i686")
url="https://github.com/Rudd-O/qubes-pass"
license=('GPL3')
depends=('sh' 'qubes-vm-core')
makedepends=(pkg-config make)

source=(https://github.com/Rudd-O/qubes-pass/archive/v${pkgver}.tar.gz)
sha256sums=('b4b41b91f628f318bc7d1476fe086f1a468b41703485fe6480660b94089c7710')

_srcname="${pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${_srcname}/"
    make install-client DESTDIR="$pkgdir"
}

