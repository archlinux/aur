#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jquery')
pkgname=('python-django-jquery')
_module='django-jquery'
pkgver='1.12.2'
pkgrel=1
pkgdesc="A fast, small, and feature-rich JavaScript library for Django."
url="http://bitbucket.org/massimilianoravelli/django-jquery"
depends=('python' 'python-django')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jquery/django-jquery-${pkgver}.tar.gz")
sha256sums=('99cebaa1f066550ffe1a4b149571287915a19dd2feef8632c1ee19f97738a0bb')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
