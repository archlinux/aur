# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=mem_top
pkgname=python-mem_top
pkgver=0.1.0
pkgrel=1
arch=('any')
pkgdesc="Shows top suspects for memory leaks in your Python program"
url="https://pypi.python.org/pypi/mem_top/0.1.0"
license="MIT"
depends=('python')
source=(https://pypi.python.org/packages/source/m/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('18a5af60a4821de5ef6e20e7ca41bf3d')


package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --prefix=/usr --root=${pkgdir}
}
