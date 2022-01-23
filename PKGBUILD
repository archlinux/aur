# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-selenium
pkgver=3.141.0
pkgrel=4
pkgdesc="Python binding for Selenium Remote Control"
arch=('x86_64')
url="https://pypi.python.org/pypi/selenium"
license=('Apache')
depends=('python' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('geckodriver: Firefox driver support')
source=("https://pypi.io/packages/source/s/selenium/selenium-$pkgver.tar.gz")
sha512sums=('3d2afbe9e96f88e9c055a89786b5090af387d3feba4598577b70fd3e0b20c2c09c4b25af920c654f52ec7e34f23181e6d278ac05f1a1f960d2d371ce7a6b82d8')

package() {
  cd "$srcdir/selenium-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# check() takes too many dependencies to run
