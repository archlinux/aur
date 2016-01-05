# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-usbtmc
pkgver=0.7
pkgrel=1
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('any')
url="https://github.com/python-ivi/python-usbtmc"
license=('MIT')
depends=('python' 'python-pyusb')

source=("python-usbtmc-$pkgver.tar.gz::https://github.com/python-ivi/python-usbtmc/archive/v$pkgver.tar.gz")
md5sums=('a91bd429eb349e6fb6f583a082e5409f')

build() {
  cd "$srcdir/python-usbtmc-$pkgver"
}

package() {
  cd "$srcdir/python-usbtmc-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

