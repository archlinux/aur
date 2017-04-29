pkgbase=('python-pypugjs')
pkgname=('python-pypugjs')
_module='pypugjs'
pkgver='4.2.2'
pkgrel=1
pkgdesc="PugJS syntax template adapter for Django, Jinja2, Mako and Tornado templates - copy of PyJade with the name changed"
url="http://github.com/matannoam/pypugjs"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/p/pypugjs/pypugjs-${pkgver}.tar.gz")
md5sums=('8a5fc830381bc0b75737da153de36bfb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
