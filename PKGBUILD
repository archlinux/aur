# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-password-validation
pkgver=0.1.1
pkgrel=1
pkgdesc="A backport of the password validation system from Django 1.9, for use on earlier Django versions"
arch=('any')
url='https://django-password-validation.readthedocs.org/en/latest/'
license=('BSD')
depends=('python-django')
source=("https://pypi.python.org/packages/source/d/django-password-validation/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6c6b44c5faeb21b332128c4988c5ebf1b68ed2dd6db84160dba7c21e42aa4715')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
