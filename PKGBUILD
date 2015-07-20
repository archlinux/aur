# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pyvisa
pkgver=1.7
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
arch=('any')
url="https://github.com/hgrecco/pyvisa"
license=('MIT')
depends=('python' 'python-distribute' 'python-docutils')
optdepends=(
  'python-pyvisa-py: Pure Python backend'
)

source=("pyvisa-$pkgver.tar.gz::https://github.com/hgrecco/pyvisa/archive/$pkgver.tar.gz")
md5sums=('a55449a61536c59174b8ad207f321201')

build() {
  cd "$srcdir/pyvisa-$pkgver"
}

package() {
  cd "$srcdir/pyvisa-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}


