# Maintainer: Zachary Riedlshah <git@zacharyrs.me>

name='qtfaststart'
pkgname=python2-$name
pkgver=1.8
pkgrel=1
pkgdesc="Quicktime atom positioning in Python for fast streaming"
arch=('any')
url="https://pypi.python.org/pypi/$name"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2')
options=(!emptydirs)

source=("https://pypi.python.org/packages/source/${name::1}/${name}/${name}-${pkgver}.tar.gz")
sha256sums=('b0442315311f1c1130a34e4e6b04557f5f4aa332ac40bfb1d761418866749241')

package() {
  cd "$srcdir/$name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
