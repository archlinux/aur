# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-recaptcha
pkgver=1.3.1
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=('any')
url='https://github.com/praekelt/django-recaptcha'
license=('BSD')
depends=('python-django')
source=("https://github.com/praekelt/django-recaptcha/archive/${pkgver}.tar.gz")
sha256sums=('bfe550d95540d049cc9292e38fa6008c8d234d73d6d686eae1d578f17ed6f1bd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
