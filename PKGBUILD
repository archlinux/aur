#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-jquery')
pkgname=('python-django-jquery')
_module='django-jquery'
pkgver='1.9.1'
pkgrel=1
pkgdesc="A fast, small, and feature-rich JavaScript library for Django."
url="http://bitbucket.org/massimilianoravelli/django-jquery"
depends=('python' 'python-django')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-jquery/django-jquery-${pkgver}.tar.gz")
sha256sums=('70df837586a69607acb82a1d35a10d11e0dc11403949e4a2f3c2fcc726036abb')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
