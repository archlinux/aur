pkgbase=('python-pypugjs')
pkgname=('python-pypugjs')
_module='pypugjs'
pkgver='5.1.0'
pkgrel=1
pkgdesc="PugJS syntax template adapter for Django, Jinja2, Mako and Tornado templates - copy of PyJade with the name changed"
url="http://github.com/kakulukia/pypugjs"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/kakulukia/pypugjs/archive/v5.1.0.tar.gz")
md5sums=('5a8a89ecfbe54eeb1ff6bea37addd52e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
