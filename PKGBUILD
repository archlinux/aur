# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-crontab

pkgbase=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=2.2.4
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('GPL')
source=("https://pypi.python.org/packages/bb/eb/65603b7e76542d301bedea22bf46248ce964de6144550f626b68cb4156e0/$pkgname-$pkgver.tar.gz")

md5sums=('f0b3140d3db5150d9e01bf7f30abb602')

package_python-crontab () {
  depends=('python' 'python-dateutil')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-crontab () {
  depends=('python2' 'python2-dateutil')
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
