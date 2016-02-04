#Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase=('python-django-markitup')
pkgname=('python-django-markitup')
_module='django-markitup'
pkgver='2.3.0'
pkgrel=1
pkgdesc="Markup handling for Django using the MarkItUp! universal markup editor"
url="https://github.com/zsiciarz/django-markitup"
depends=('python-django' 'jquery')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-markitup/django-markitup-${pkgver}.tar.gz")
md5sums=('3de508b3bfb7b5a421c5cce4fc4c54f6')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
