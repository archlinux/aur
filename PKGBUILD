# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=vorta
pkgver=0.4.4
pkgrel=1
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-keyring' 'python-sentry_sdk')
makedepends=('python-pip')
options=(!emptydirs)
source=(https://pypi.io/packages/source/v/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ca92a12ddef9589b0dd5e5d427022f4471da3abf444b72adf072963f7b435f70')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
