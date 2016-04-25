pkgname=krudio-git
pkgver=20160425
_git=0d1a3bec3957dbee7673cc02572802c016eaaa27
_repo=krudio
pkgrel=1
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
