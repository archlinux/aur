# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-django-omnibus
pkgver=0.2.0
pkgrel=1
pkgdesc='Django/JavaScript WebSocket Connections'
url='https://pypi.python.org/pypi/django-omnibus'
arch=('any')
license=('BSD')
depends=('python' 'python-django')
source=("https://pypi.python.org/packages/source/d/django-omnibus/django-omnibus-${pkgver}.tar.gz")
md5sums=('becb93c70f2c885d8b8448a5363aab7c')

package() {
  cd django-omnibus-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
