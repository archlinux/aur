pkgbase=('python-pypugjs')
pkgname=('python-pypugjs')
_module='pypugjs'
pkgver='5.8.1'
pkgrel=1
pkgdesc=" PugJS syntax adapter for Django, Jinja2 and Mako templates"
url="http://github.com/kakulukia/pypugjs"
depends=('python' 'python-six' 'python-chardet')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/kakulukia/pypugjs/archive/v5.8.1.zip")
md5sums=('0fd51b6ebe1bc49726fc40ce74fa7aac')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
