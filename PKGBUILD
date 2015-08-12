# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=mem_top
pkgname=python-mem_top
pkgver=0.1.2
pkgrel=1
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top"
license="MIT"
depends=('python')
source=(https://pypi.python.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('78f512c70f05399fb13ea09b0e26c499')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir}
}
