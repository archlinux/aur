pkgbase=('python-fastentrypoints')
pkgname=('python-fastentrypoints')
_module='fastentrypoints'
pkgver='0.2'
pkgrel=1
pkgdesc=""
url="https://github.com/ninjaaron/fast-entry_points"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/26/8d/11d68ebaa9b4b8b9fd58a6d33b0e5b111fc872534edefd1abd162b6753cc/fastentrypoints-${pkgver}.tar.gz")
md5sums=('60ba08caebd032a2a4ceee05b725f343')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
