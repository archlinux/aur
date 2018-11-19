# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=vorta
pkgver=0.4.0
pkgrel=1
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-keyring' 'python-sentry_sdk')
makedepends=('python-pip')
options=(!emptydirs)
source=(https://pypi.io/packages/source/v/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('60b4cab8b49e6f96b33a698bc3b46e4701c920da282e93fe8b5a29fb651aa45b')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
