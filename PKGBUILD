# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python2-lesscpy
pkgver=0.12.0
pkgrel=1
pkgdesc="python2-lesscpy"
arch=('i686' 'x86_64')
url="https://github.com/lesscpy/lesscpy"
license=('MIT')
depends=('python2' 'python2-ply')
source=("https://pypi.python.org/packages/32/38/a55150ec018cf6fe11012bf1d988cd737af7f82227e4ac753619f0fb27a4/lesscpy-0.12.0.tar.gz")

build() {
  cd "$srcdir"/lesscpy-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/lesscpy-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('0a5a3ca4091ad3fb62ac6f705f8463d4')
