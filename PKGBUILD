# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-crontab

pkgbase=python-crontab
pkgname=('python-crontab' 'python2-crontab')
pkgver=1.8.1
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('GPL')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('44c27ddfb4084cff337d4c24419bc313')

package_python-crontab () {
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-crontab () {
  cd "$srcdir/$pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
