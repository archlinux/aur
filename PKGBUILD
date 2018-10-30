pkgname=python-cu2qu
_module=cu2qu
pkgver=1.6.4
pkgrel=1
pkgdesc="Cubic-to-quadratic bezier curve conversion"
url="https://github.com/googlei18n"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/29/33/6186137547733d15ae15ad00bc81688d474fdbb7e1aad4ee35c1d5228936/cu2qu-${pkgver}.zip")
md5sums=('5d3fe137d091286f8086588734cedb6b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
