# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=metaio
pkgver=8.4.0
pkgrel=1
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. metaio"
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
sha256sums=('8990d5aa23614328880d15af72071009a578cedf75174e437b3d63643b850b76')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
