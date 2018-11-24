# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

_name='flask-restinpeace'

pkgname="python-${_name}"
pkgver='1.2.1'
pkgrel=1
pkgdesc="Create Flask REST APIs in peace."
arch=('any')
url="https://github.com/kynikos/lib.py.flask-rip"
license=('MIT')
depends=('python-flask-marshmallow' 'python-apispec')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4c585d271c270dfad1848c0fe157ff8b7d75dce4291414c817607219d0ea92c7')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
