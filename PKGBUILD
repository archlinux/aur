# Maintainer: piernov <piernov@piernov.org>

pkgname=python-jsonref
pkgver=0.2
pkgrel=1
pkgdesc="An implementation of JSON Reference for Python"
arch=('x86_64')
url="https://pypi.org/project/jsonref"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/b3/cf/93d4f34d76863d4fb995cb8e3e4f29908304065ce6381e0349700c44ad0c/jsonref-$pkgver.tar.gz")
md5sums=('42b518b9ccd6852d1d709749bc96cb70')

build() {
  cd "$srcdir"/jsonref-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/jsonref-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
