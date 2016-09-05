pkgname=('python-crontab2' 'python2-crontab2')
projname=python-crontab
pkgver=2.1.1
_trunkver=2.1
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
conflicts=('python-crontab' 'python2-crontab')
url='https://launchpad.net/python-crontab'
license=('LGPLv3')
source=("https://launchpad.net/python-crontab/trunk/${_trunkver}/+download/${projname}-${pkgver}.tar.gz")
md5sums=('7f0e1a65f4a57f10cbc33f818cf5b82c')

package_python-crontab2() {
  depends=('python' 'python-dateutil')
  cd "${srcdir}/${projname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-crontab2() {
  depends=('python2' 'python2-dateutil')
  cd "${srcdir}/${projname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
