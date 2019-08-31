# Mantainer: MCMic <come@chilliet.eu>
# Generated with pip2pkgbuild

pkgbase='python-bson'
pkgname=('python-bson')
_module='bson'
pkgver='0.5.8'
pkgrel=1
pkgdesc="BSON codec for Python"
url="http://github.com/py-bson/bson"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('13fb1e5486a611374a06177663c2ab878f0c192c8fc8765a63dfef86859006c9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
