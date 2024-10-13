# Maintainer: Thomas Gläßle <aur@coldfix.de>

_pyname=eval
pkgname=pyval
pkgver=0.0.5
pkgrel=2
pkgdesc="Show value of python expressions, automatically imports objects"
arch=('any')
url="https://github.com/coldfix/${pkgname}"
license=('Unlicense')
depends=('python')
makedepends=()
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('e13bf4181cdf06cadb9d507bcb40aef426849b2949f82e92dfc9926c8600b78e')

package() {
    cd "$srcdir/$_pyname-$pkgver"
    install -D -m 0755 "pyval" "${pkgdir}/usr/bin/pyval"
    install -D -m 0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
