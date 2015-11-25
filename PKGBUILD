pkgname=opensesame-pygaze-git
pkgver=0.6.0a6.72fbf96
pkgrel=1
pkgdesc="eyetracking plugins for OpenSesame"
arch=('i686' 'x86_64')
url="https://github.com/esdalmaijer/PyGaze"
license=('GPL3')
depends=('opensesame')
makedepends=('git')
provides=('opensesame-pygaze')

source=("$pkgname"::'git://github.com/esdalmaijer/PyGaze.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
