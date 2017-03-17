# Maintainer:  Razer <razer@neuf.fr>

pkgname=python-pyserial-asyncio
pkgver=0.3
pkgrel=1
pkgdesc="Asyncio extension package for pyserial "
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'armv8h')
url="https://github.com/pyserial/pyserial-asyncio"
license=('BSD')
depends=('python-pyserial')
source=('https://pypi.python.org/packages/66/74/83c3ea7d6d8779bde526e0049eb8ff7e77d4233808b878db21ede27ee8f3/pyserial-asyncio-0.3.tar.gz')
md5sums=('b190b42a4849674cccbf5aefa58db545')

build() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

