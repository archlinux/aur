# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python2-usbtmc
pkgver=0.6
pkgrel=1
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('any')
url="https://github.com/python-ivi/python-usbtmc"
license=('MIT')
depends=('python2' 'python2-pyusb')

source=("python-usbtmc-$pkgver.tar.gz::https://github.com/python-ivi/python-usbtmc/archive/v$pkgver.tar.gz")
md5sums=('41af1838195e03448dee941794bd2953')

build() {
  cd "$srcdir/python-usbtmc-$pkgver"
}

package() {
  cd "$srcdir/python-usbtmc-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

