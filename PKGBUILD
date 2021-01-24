# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-django-rest-polymorphic'
pkgname=('python-django-rest-polymorphic')
_module='django-rest-polymorphic'
pkgver='0.1.9'
pkgrel=1
pkgdesc="Polymorphic serializers for Django REST Framework."
url="https://github.com/apirobot/django-rest-polymorphic"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('43d7f8c5b43a225fe792ac40e98d196d4c8d6872a796b61246085819b1b5f1c6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
