# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-seqeval'
pkgname=('python-seqeval')
_module='seqeval'
pkgver='1.2.2'
pkgrel=1
pkgdesc="Testing framework for sequence labeling"
url="https://github.com/chakki-works/seqeval"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f28e97c3ab96d6fcd32b648f6438ff2e09cfba87f05939da9b3970713ec56e6f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
