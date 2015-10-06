# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-flask-cors
pkgname=python-apns-clerk
_pkgname=apns-clerk
pkgver=0.2.0
pkgrel=1
pkgdesc="Python client for Apple Push Notification service (APNs)"
arch=('any')
url='https://pypi.python.org/pypi/apns-clerk'
license=('')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('f7c302305552ae6bf134f776dafa139c')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
