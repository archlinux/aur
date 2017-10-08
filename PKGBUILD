# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=libframe
pkgver=8.30
pkgrel=1
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. libframe"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/${pkgname}-${pkgver}.tar.gz")
sha256sums=('374743ccce835427a0900590a515c112661760e12ec596159d3f86073dd099da')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
