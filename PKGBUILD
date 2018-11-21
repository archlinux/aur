# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=vorta
pkgver=0.4.3
pkgrel=1
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-keyring' 'python-sentry_sdk')
makedepends=('python-pip')
options=(!emptydirs)
source=(https://pypi.io/packages/source/v/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('f5459100f58076269740b02987648ebb3ea8be90b2a0496f9e19cde7ef90c381')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
