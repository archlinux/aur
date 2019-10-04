# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="python-tornado5"
_pkgname="tornado"
pkgver=5.1.1
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools (this package gives the old API for some applications)'
arch=('any')
conflicts=( 'python-tornado')
url="https://pypi.org/project/$_pkgname/$pkgver"
license=('Apache')
provides=('python-tornado')
source=("https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426/$_pkgname-$pkgver.tar.gz")
md5sums=('a1ce4f392d30ff0ebcb255150d89b826')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    
    python setup.py install --root="${pkgdir}" --optimize=1
}
 
