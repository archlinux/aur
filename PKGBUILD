# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python2-lesscpy
pkgver=0.11.1
pkgrel=1
pkgdesc="python2-lesscpy"
arch=('i686' 'x86_64')
url="https://github.com/lesscpy/lesscpy"
license=('MIT')
depends=('python2' 'python2-ply')
source=("https://pypi.python.org/packages/ae/a1/b036086a377590b8f9ff006537f428eb23755cbb18ba4bcfcfb52b313b7b/lesscpy-0.11.1.tar.gz")

build() {
  cd "$srcdir"/lesscpy-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/lesscpy-$pkgver
  python2 setup.py install --root="$pkgdir"
}

md5sums=('d2ff23323591c7e8c77b2777bf9e53f0')
