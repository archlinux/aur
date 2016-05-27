# Contributer: Donald Carr<sirspudd@gmail.com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qml-box2d
pkgver=2.3.2
pkgrel=1
pkgdesc='QML Box2D bindings'
arch=('x86_64')
url='https://github.com/qml-box2d/qml-box2d/blob/master/README'
license=('GPL')
depends=('qt5-declarative')
makedepends=('gcc' 'qt5-base')
source=("git://github.com/qml-box2d/qml-box2d")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  INSTALL_ROOT="$pkgdir" make install
}
