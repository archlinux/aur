pkgbase=('python2-efilter')
pkgname=('python2-efilter')
_module='efilter'
pkgver='1438631774'
pkgrel=1
pkgdesc="EFILTER query language"
url="https://github.com/google/dotty/"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/20/83/ecdf93ca3a02d26d86766af1e077b7c20b2b133a1dff8e37707c8e1eea1a/efilter-1438631774.tar.gz#md5=9bad2387facf706b1f7ba1411274406a")
md5sums=('9bad2387facf706b1f7ba1411274406a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
