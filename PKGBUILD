#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-pgallery')
pkgname=('python-django-pgallery')
_module='django-pgallery'
pkgver='0.7.dev0'
pkgrel=1
pkgdesc="Photo gallery app for PostgreSQL and Django."
url="https://github.com/zsiciarz/django-pgallery"
depends=('python-django' 'python-pillow' 'python-psycopg2'
         'python-django-markitup' 'python-django-model-utils' 'python-django-hstore')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-pgallery/django-pgallery-${pkgver}.tar.gz")
sha256sums=('d30d0fd716c1c383cb9b8e5d25fc80d9854b2ba57cd15807f5de845f530b4674')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
