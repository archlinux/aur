# Maintainer: Ishan Arora <ishanarora@gmail.com>

pkgname=python-u-msgpack
pkgver=2.1
pkgrel=1
pkgdesc="Lightweight msgpack serializer and deserializer written in pure Python"
arch=('any')
url="https://github.com/vsergeev/u-msgpack-python"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/u/u-msgpack-python/u-msgpack-python-$pkgver.tar.gz")
md5sums=('2ccadbf06c7e70bbdb58e920d045d50c')

package() {
  cd "$srcdir/u-msgpack-python-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
