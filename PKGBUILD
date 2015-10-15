pkgname=naturalscrolling
pkgver=0.7
pkgrel=1
pkgdesc='Natural Scrolling application'
arch=('x86_64' 'i686')
url='https://github.com/cemmanouilidis/naturalscrolling'
license=('GPL3')
depends=('python2' 'python2-distutils-extra')
source=('git+https://github.com/cemmanouilidis/naturalscrolling.git')
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python2 setup.py build
}

package() {
  cd "$pkgname"
  python2 setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
