pkgbase=('python-hdmedians')
pkgname=('python-hdmedians')
_module='hdmedians'
pkgver='0.13'
pkgrel=1
pkgdesc="High-dimensional medians"
url="http://github.com/daleroberts/hdmedians"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/h/hdmedians/hdmedians-${pkgver}.tar.gz")
md5sums=('27945c64fd9ba1a46ef6c136d402291d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
