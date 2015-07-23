# Maintainer: Manuel Olguin <molguin@dcc.uchile.cl>
pkgname=batmon
pkgver=0.5beta1
pkgrel=1
epoch=
pkgdesc="A lightweight battery monitor in C++."
arch=('any')
url="https://github.com/arachnid92/Batmon"
license=('GPL2')
groups=()
depends=(libnotify boost-libs gdk-pixbuf2 gtk2 glib2)
makedepends=(boost cmake git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/arachnid92/Batmon.git")
noextract=()
md5sums=('SKIP')
_gitname=Batmon

build() {
	cd $_gitname
    cmake ./
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install
}
