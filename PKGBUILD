# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python-croniter
pkgver=0.3.23
pkgrel=1
pkgdesc="python-croniter"
arch=('i686' 'x86_64')
url="https://pypi.org/project/croniter/"
license=('MIT')
depends=('python2')
source=("https://files.pythonhosted.org/packages/28/27/f2c883373aa58fe77ecfc09a984f1ae52bc05790c0eee66b87f65d14cbfe/croniter-0.3.23.tar.gz")

build() {
  cd "$srcdir"/croniter-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/croniter-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('8925413b536fd390ec7b9fd73f50e5d3')
