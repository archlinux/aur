# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=(python-selenium python2-selenium)
pkgver=2.47.1
pkgrel=1
pkgdesc="Python binding for Selenium Remote Control"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/selenium"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('lib32-glibc: Firefox x86 webdriver support for x86_64')
source=("http://pypi.python.org/packages/source/s/selenium/selenium-${pkgver}.tar.gz")
md5sums=('7a2e267e8ef5c221bfd6387c2ad5f3bc')

package_python-selenium() {
  depends=('python')
  cd "$srcdir/selenium-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-selenium() {
  depends=('python2')
  cd "$srcdir/selenium-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# check() takes too many dependencies to run

