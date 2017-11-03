# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=lscsoft-glue
pkgname=python2-${_pkgname}
pkgver=1.57.0
pkgrel=1
pkgdesc="The LIGO Scientific Consortium Algorithm Library Suite. ${_pkgname}"
arch=(any)
url="https://wiki.ligo.org/DASWG/LALSuiteInstall"
license=('unknown')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://software.ligo.org/lscsoft/source/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('732301c25a6316ea863f86f5b3bb16febbdc119affca0060886a720730050721')
package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
