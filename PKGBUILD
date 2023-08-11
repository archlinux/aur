# Maintainer: Markus Koch <markus@notsyncing.net>
pkgname=python-cocotb-coverage-git
pkgver=1.1.30.g21330f3
pkgrel=1
pkgdesc="Functional Coverage and Constrained Randomization Extensions for Cocotb"
arch=('any')
url="https://github.com/mciepluc/cocotb-coverage"
license=('BSD2')
depends=('python-cocotb' 'python-pyaml' 'python-constraint')
makedepends=('python-setuptools')

source=("git+https://github.com/mciepluc/cocotb-coverage")
sha256sums=('SKIP')

build() {
    cd "$srcdir/cocotb-coverage"
    python setup.py build
}

package() {
    cd "$srcdir/cocotb-coverage"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
}
