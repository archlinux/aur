# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-recaptcha
pkgver=1.0.4
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=('any')
url='https://github.com/praekelt/django-recaptcha'
license=('BSD')
depends=('python-django')
source=("https://github.com/praekelt/django-recaptcha/archive/${pkgver}.tar.gz")
sha256sums=('8af0da767b07ca4d7a5a2be329776fe6dbab183c3da61ae30796e1a9354eea6c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
