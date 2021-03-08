pkgname=python-orient
pkgver=1.5.5
pkgrel=1
pkgdesc="Python bindings for OrientDB"
arch=('any')
url=https://github.com/mogui/pyorient
license=('Apache')
groups=()
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/p/pyorient/pyorient-${pkgver}.tar.gz)
sha256sums=('6f5c657a4a13bcc5e6875850c6b51fedf2fccd15a86ff1fef6cdedb546feb1ce')

build() {
  cd "$srcdir"/pyorient-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pyorient-${pkgver}
  python setup.py install --root="$pkgdir/" --prefix="/usr" --optimize=1
}
