# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-recaptcha
pkgver=2.0.4
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=('any')
url='https://github.com/praekelt/django-recaptcha'
license=('BSD')
depends=('python-django')
source=("https://github.com/praekelt/django-recaptcha/archive/${pkgver}.tar.gz")
sha256sums=('dfb8ea7c63134a7199b6d92ace0bc8a75c03a5b2ff5193ba46554c41aec26be6')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
