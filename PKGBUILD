# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=lalmetaio
pkgver=1.3.1
pkgrel=2
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. lalmetaio"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=('lalsuite')
depends=('metaio' 'lalcore')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/lalsuite/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f88e4baed92fd064e055ec7975d3098dfd6978b1a3209b220d1e87fdd4da2991')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=$pkgdir/usr
    make -j
    make install
}
