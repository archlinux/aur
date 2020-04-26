pkgbase=python-cron-descriptor
pkgname=('python-cron-descriptor' 'python2-cron-descriptor')
projname=cron-descriptor
pkgver=1.2.24
pkgrel=1
pkgdesc="A Python library that converts cron expressions into human readable strings."
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Salamek/${projname}/archive/$pkgver.tar.gz")
sha256sums=('9b47d2e169f52293941bc64f57b3f6fef2e35f478c5bca5542388f7f6ed3d628')

package_python-cron-descriptor() {
  depends=('python')

  cd "${srcdir}/${projname}-${pkgver}"
  python3 setup.py install --root=$pkgdir/ --optimize=1
}

package_python2-cron-descriptor() {
  depends=('python2')

  cd "${srcdir}/${projname}-${pkgver}"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
