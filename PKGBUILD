# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=mem_top
pkgname=python-mem_top
pkgver=0.1.6
pkgrel=1
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top"
license=("MIT")
depends=('python')
source=(https://pypi.io/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('797f791971b2ad8cebdb1ba4f5f650e5')


package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
