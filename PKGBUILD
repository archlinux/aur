# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=mem_top
pkgname=python-mem_top
pkgver=0.1.1
pkgrel=1
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top"
license="MIT"
depends=('python')
source=(https://pypi.python.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('28375713413f222e8a07e5538ef6815a')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir}
}
