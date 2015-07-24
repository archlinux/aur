# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=python2-pyvona
_pypiname=pyvona
pkgver=0.24
pkgrel=1
pkgdesc="Python text-to-speech IVONA Wrapper"
arch=('any')
url="http://zacharybears.com/pyvona/"
license=('MIT')
depends=('python2')
makedepends=('python2')
conflicts=('python2-pyvona-git')
provides=('python2-pyvona')
source=("https://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('2248cabcd2ac33fe857bf6e9e02ea72e')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
