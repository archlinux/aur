# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=laldetchar
pkgver=0.3.5
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. laldetchar"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('lalcore' 'lalmetaio' 'lalsimulation' 'lalburst')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b0900de0b9520aae61e1ad5b97d4be46a47cbf1b12485b7fb783d2e0db804e70')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
