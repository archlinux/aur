#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-photologue')
pkgname=('python-django-photologue')
_module='django-photologue'
pkgver='3.5.1'
pkgrel=1
pkgdesc="Powerful image management for the Django web framework."
url="https://github.com/jdriscoll/django-photologue"
depends=('python-django' 'python-pillow' 'python-django-sortedm2m' 'python-exifread')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-photologue/django-photologue-${pkgver}.tar.gz")
sha256sums=('17eb98de9b46384eb232b81ce3c44244455313224bd35bbc605929c1d092529e')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
