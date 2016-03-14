#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-django-pgallery')
pkgname=('python-django-pgallery')
_module='django-pgallery'
pkgver='0.7.1.dev0'
pkgrel=1
pkgdesc="Photo gallery app for PostgreSQL and Django."
url="https://github.com/zsiciarz/django-pgallery"
depends=('python-django' 'python-pillow' 'python-psycopg2'
         'python-django-markitup' 'python-django-model-utils' 'python-django-hstore')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-pgallery/django-pgallery-${pkgver}.tar.gz")
sha256sums=('df86e0fe7c3d864eec6012290e60c22d090eb24a40e2ecf6ef464288eb6f711f')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
