# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='python-djangorestframework-xml'
pkgname=('python-djangorestframework-xml')
_module='djangorestframework-xml'
pkgver='2.0.0'
pkgrel=1
pkgdesc="XML support for Django REST Framework"
url="https://github.com/jpadilla/django-rest-framework-xml"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('35f6c811d0ab8c8466b26db234e16a2ed32d76381715257aebf4c7be2c202ca1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
