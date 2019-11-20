# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-pystatparser-git
pkgver=0.1
pkgrel=1
pkgdesc="Simple Python statistical (CKY) parser"
url="https://github.com/emilmont/pyStatParser"
arch=('any')
provides=('python-pystatparser')
depends=('python')
makedepends=('python-setuptools')
_name='pyStatParser'
source=("git+https://github.com/emilmont/$_name.git")
sha256sums=('SKIP')

build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
