# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=mem_top
pkgname=python-mem_top
pkgver=0.1.5
pkgrel=2
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top"
license=("MIT")
depends=('python')
source=(https://pypi.io/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('dbdb2e9fe93d2f0d6c7ffeacbf7c6415')


package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
