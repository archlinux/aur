# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-crontab

pkgbase=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=1.8.1
pkgrel=3
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('GPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('44c27ddfb4084cff337d4c24419bc313')

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
# vim:set ts=2 sw=2 et:
