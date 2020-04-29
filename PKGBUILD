# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python-croniter
pkgver=0.3.31
pkgrel=1
pkgdesc="python-croniter"
arch=('i686' 'x86_64')
url="https://pypi.org/project/croniter/"
license=('MIT')
depends=('python2')
source=("https://files.pythonhosted.org/packages/29/19/62078c6b965b10d8c558202dbddc38292096ed567adfeb9d5570083f7b4e/croniter-0.3.31.tar.gz")

build() {
  cd "$srcdir"/croniter-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/croniter-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('84020f61103e8d715256547207fefe79')
