# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-recaptcha
pkgver=1.3.0
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=('any')
url='https://github.com/praekelt/django-recaptcha'
license=('BSD')
depends=('python-django')
source=("https://github.com/praekelt/django-recaptcha/archive/${pkgver}.tar.gz")
sha256sums=('5bba837588b345a389d6d6e194c823e2f693ac432cdd712fd519be6cf217f945')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
