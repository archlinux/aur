pkgbase=python-cron-descriptor
pkgname=('python-cron-descriptor' 'python2-cron-descriptor')
projname=cron-descriptor
pkgver=1.2.7
pkgrel=1
pkgdesc="A Python library that converts cron expressions into human readable strings."
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/Salamek/${projname}/archive/$pkgver.tar.gz")
md5sums=('823b71f242f7abb4c5a7ee033ce2bd97')

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
