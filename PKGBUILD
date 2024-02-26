# Maintainer: Chance Chen <ufbycd@163.com>
pkgname=python-fdt
_name=${pkgname#python-}
pkgver=0.3.3
pkgrel=1
pkgdesc="Flattened Device Tree Python Module"
arch=('any')
url="https://github.com/molejar/pyFDT"
license=('Apache')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/molejar/pyFDT/archive/master.zip")
sha256sums=('459518f497ac5b3f856f7e0a9bbb5970f0e2ff1910d9955b8f1bae9449883b5f')

build() {
    cd "pyFDT-master"
    python setup.py build
}

package() {
    cd "pyFDT-master"
    python setup.py install --root="$pkgdir" --skip-build
}
