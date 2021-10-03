# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=pypropack
pkgver=0.0.1
pkgrel=1
pkgdesc='A python wrapper for the PROPACK library '
url="https://github.com/jakevdp/pypropack"
license=('BSD')
arch=('any')
depends=('python')
makedepends=()
source=("git+$url")
sha512sums=('SKIP')

package() {
    cd $pkgname
    python3 setup.py install --root="${pkgdir}" --optimize=1
}
