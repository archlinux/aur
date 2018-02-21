# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-recaptcha
pkgver=1.4.0
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=('any')
url='https://github.com/praekelt/django-recaptcha'
license=('BSD')
depends=('python-django')
source=("https://github.com/praekelt/django-recaptcha/archive/${pkgver}.tar.gz")
sha256sums=('c93aedc3a22ae6bfa6d923d3dfb1226f679eca5cf6eb3e055196574e4c657041')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
