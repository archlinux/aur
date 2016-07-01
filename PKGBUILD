pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.0'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/5e/58/b0770a8bced9b02471dabd2ca6e174c1748523e45494a1ac6bad6b2d04b3/dirlog-${pkgver}.tar.gz")
md5sums=('996c2e45e4e9764fb0d9b4e64e2fbddc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
