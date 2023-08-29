# Maintainer: Patrik Bachan	<patrikbachan AT gmail DOT net>
_name=canalystii
pkgname=python-canalystii
pkgver=0.1
pkgrel=1
pkgdesc='Canalyst-II USB CAN probe Driver for Python'
arch=('any')
url="https://github.com/projectgus/python-canalystii"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7471e09cdf85c407fd4a7ee0fd4e6de714eb9fca57434befbff02b801dcf0f84')
makedepends=('python-setuptools')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}