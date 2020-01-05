#Maintainer: jnanar <info@agayon.be>

pkgname=python-kivy-garden-contextmenu
pkgver=01c6011
pkgrel=1
pkgdesc="Collection of classes for easy creating context and application menus."
arch=(any)
url="https://github.com/kivy-garden/contextmenu"
license=('MIT')
depends=('python')
options=(!emptydirs)
provides=('python-kivy-garden-contextmenu')
source=('git+https://github.com/kivy-garden/contextmenu.git')
_gitname="contextmenu"
sha512sums=('SKIP')


pkgver() {
  cd $_gitname
  git rev-parse --short HEAD  | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

