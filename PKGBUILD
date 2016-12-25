# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
pkgname=python-gnuplotpy
pkgver=1
pkgrel=1
pkgdesc="Basic Python interface to Gnuplot."
arch=('any')
url="https://github.com/jtambasco/gnuplotpy"
license=('MIT')
depends=('python'
         'gnuplot')
makedepends=('python-setuptools')
options=(!emptydirs)
source=('git+https://github.com/jtambasco/gnuplotpy.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/${pkgname:7}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
