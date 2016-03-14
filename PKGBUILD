#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jquery-ui')
pkgname=('python-django-jquery-ui')
_module='django-jquery-ui'
pkgver='1.11.4'
pkgrel=1
pkgdesc="Widget and interaction library to build highly interactive web applications"
url="https://github.com/benbacardi/django-jquery-ui"
depends=('python' 'python-django-jquery')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jquery-ui/django-jquery-ui-${pkgver}.tar.gz"
        "LICENSE::https://github.com/benbacardi/django-jquery-ui/blob/master/LICENSE?raw=true")
sha256sums=('725d7beb5eac57e02a295f9d9db0277d3cc531156f0ff6ba8153442f79ec1210'
            '163fe5c92fa1e7c0f31b8d70a2f4655879a57f42a4ea2387398bb45c374ba28f')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
