pkgbase=python-cron-descriptor
pkgname=python-cron-descriptor
projname=cron-descriptor
pkgver=1.2.25
pkgrel=1
pkgdesc="A Python library that converts cron expressions into human readable strings."
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Salamek/${projname}/archive/$pkgver.tar.gz")
sha256sums=('500b343b7c119515bb0a091c37f3bce0885e67a776f94dea268a3be35934b6bb')

package_python-cron-descriptor() {
  depends=('python')

  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py install --root=$pkgdir/ --optimize=1
}
