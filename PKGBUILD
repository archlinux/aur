#Maintainer: David McInnis<davidm@eagles.ewu.edu>

pkgbase=('python-django-pgallery')
pkgname=('python-django-pgallery')
_module='django-pgallery'
pkgver='0.6.1.dev0'
pkgrel=1
pkgdesc="Photo gallery app for PostgreSQL and Django."
url="https://github.com/zsiciarz/django-pgallery"
depends=('python-django' 'python-pillow' 'python-psycopg2'
         'python-django-markitup' 'python-django-model-utils' 'python-django-hstore')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/django-pgallery/django-pgallery-${pkgver}.tar.gz")
sha256sums=('6ec8c7f640151844b4903cfc2bf6ca7104ec095451a392248b4a02869044585a')

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
