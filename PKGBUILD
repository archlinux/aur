# Maintainer: András Wacha <awacha at gmail dot com>
pkgname=python-tccbox
pkgver=2025.6.6
pkgrel=1
epoch=
pkgdesc="Pack platform specific tiny c compiler"
arch=("any")
url="https://github.com/metab0t/tccbox"
license=('LGPL')
groups=()
depends=()
makedepends=(python-wheel python-installer)
options=()
source=("https://files.pythonhosted.org/packages/30/16/43ffedecdbbd1976911121bead1471f92c4043128ffff22bc53b0850a90f/tccbox-2025.6.6-py3-none-manylinux2014_x86_64.whl")
sha256sums=('ba2d6594488cfede2af327ce638ea2cd261ac34c337681dbe4a8167fe776c9a1')

prepare() {
    true;
}

build() {
	true;
}



package() {
    cd "${srcdir}"
    python -m installer --destdir="$pkgdir" *.whl
}
