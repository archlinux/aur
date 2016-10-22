# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-django-omnibus
pkgver=0.2.0
pkgrel=2
pkgdesc='Django/JavaScript WebSocket Connections'
url='https://github.com/moccu/django-omnibus'
arch=('any')
license=('BSD')
depends=('python' 'python-django')
source=("git://github.com/moccu/django-omnibus")
md5sums=('SKIP')

package() {
  cd django-omnibus
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
