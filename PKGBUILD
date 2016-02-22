pkgname=bugjar
pkgver=0.1.0
pkgrel=1
pkgdesc="A interactive graphical debugger for Python code."
license=('BSD')
arch=('any')
url="http://pybee.org/bugjar/"
depends=('python2' 'python2-tkreadonly')
source=(git://github.com/pybee/bugjar.git)
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  python2 setup.py build
}

package() {
  cd ${pkgname}
  python2 setup.py install --root="${pkgdir}"
}
