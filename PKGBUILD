pkgname=krudio-git
pkgver=20160427
_git=325f493023a167f10f8bc81db4833d16575e72a6
_repo=krudio
pkgrel=3
pkgdesc="Simple Qt5 radio player"
arch=('i686' 'x86_64')
url="https://github.com/loast/${_repo}"
license=('MIT')
makedepends=('git' 'qt5-multimedia')
depends=('git' 'libnotify' 'qt5-multimedia' 'hicolor-icon-theme')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
md5sums=('SKIP')

package() {
    cd "$srcdir/${_repo}-${_git}"
    make all
    make install prefix="$pkgdir"/usr 
}
