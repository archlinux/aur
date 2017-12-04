# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
_python=python
_distname=hasel
pkgname=$_python-$_distname
pkgver=1.0.1
pkgrel=1
pkgdesc="python+numpy RGB to HSL (and vice versa) converter"
arch=(any)
url="https://github.com/sumartoyo/hasel"
license=('MIT')
depends=('python' 'python-setuptools')
provides=('python-hasel')
conflicts=('python-hasel')
source=("https://pypi.python.org/packages/1b/4b/40372d92b6371efda7e23e24fb47fa97a6c661d1f98717734daa5fefed55/$_distname-$pkgver.tar.gz")
md5sums=('c9cfa80468f3f0f70e5a55f461d04949')

package() {
  cd "$srcdir/$_distname-$pkgver"
  $_python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 || exit 1
}

