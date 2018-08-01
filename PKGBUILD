pkgbase=('python-pypugjs')
pkgname=('python-pypugjs')
_module='pypugjs'
pkgver='5.6.0'
pkgrel=1
pkgdesc=" PugJS syntax adapter for Django, Jinja2 and Mako templates"
url="http://github.com/kakulukia/pypugjs"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/kakulukia/pypugjs/archive/v5.6.0.tar.gz")
md5sums=('bbec581ffc9099bcb298fccd6f55de91')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
