# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-crontab
pkgname=python2-crontab
_pkgname=python-crontab
pkgver=1.7.2
pkgrel=1
pkgdesc='Crontab module for read and writing crontab files and accessing the system cron automatically and simply using a direct API.'
arch=('any')
url='https://pypi.python.org/pypi/python-crontab'
license=('GPL')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('794dfd7d16c9db4af675e12ca6383c5e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
