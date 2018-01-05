# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=python-spidev
_name=spidev
pkgver=3.2
pkgrel=2
pkgdesc="Python bindings for Linux SPI access through spidev"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/doceme/py-spidev"
license=('GPL')
depends=('python')
source=('https://pypi.python.org/packages/source/s/spidev/spidev-3.2.tar.gz')
md5sums=('f601676f1bb48b9aa3b3897f95216365')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
