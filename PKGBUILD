# Ilya Dikariev <dikiy_evrej_REMOVE_THIS_SHIT_at_web.de>

pkgname=sdlroids
pkgver=1.3.4
pkgrel=1
pkgdesc="Very hard and dynamic asteroids shooting game"
arch=('i686' 'x86_64')
url="http://david.hedbor.org/projects/sdlroids/"
license=('GPL')
groups=()
depends=('sdl_mixer' 'sdl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/sdlroids/sdlroids/1.3.4/sdlroids-1.3.4.tar.bz2" )
noextract=()
md5sums=('ae3c310bf2871809a0e8317f47bf0b50')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="/usr/" --mandir='${prefix}/share/man'
  make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make prefix="$pkgdir/usr/" install 
}

