# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=vorta
pkgver=0.5.3
pkgrel=1
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-keyring' 'python-sentry_sdk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.io/packages/source/v/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('b025c8bc851465ef5e1e52cdf7f45ec05df669dcb0904d76eb6d8a24689ba131')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1

}

# vim:set ts=2 sw=2 et:
