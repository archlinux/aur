pkgbase=python-cron-descriptor
pkgname=('python-cron-descriptor' 'python2-cron-descriptor')
projname=cron-descriptor
pkgver=1.2.6
pkgrel=1
pkgdesc="A Python library that converts cron expressions into human readable strings."
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Salamek/${projname}/archive/$pkgver.tar.gz")
md5sums=('2cce1cb2f81a2a2d005adae7152e97e9')

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
