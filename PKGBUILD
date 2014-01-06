# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: kevku <kevku@gmx.com>

pkgname=python-librtmp
pkgver=0.1.2
pkgrel=1
pkgdesc="Python interface to librtmp"
arch=('x86_64' 'i686')
url="https://github.com/chrippa/python-librtmp"
license=('Simplified BSD')
depends=('python-singledispatch' 'python-cffi' 'rtmpdump')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2a1d37dc84f09a5c5a99bc435029c733')
sha256sums=('207e539c04419cc2ea3380cfdee0c8576168079603168c7cc1807e9f4982e997')

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
}
