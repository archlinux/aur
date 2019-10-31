# Maintainer: Thomas Gläßle <aur@coldfix.de>

_pyname=eval
pkgname=pyval
pkgver=0.0.5
pkgrel=1
pkgdesc="Show value of python expressions, automatically imports objects"
arch=('any')
url="https://github.com/coldfix/${pkgname}"
license=('custom:UNLICENSE')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4b19c73333846fab16ff8bbf6b93250d')

package() {
    cd "$srcdir/$_pyname-$pkgver"
    install -D -m 0755 "pyval" "${pkgdir}/usr/bin/pyval"
    install -D -m 0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
