# Maintainer: Maciej Lechowski <mjlechowski@gmail.com>
pkgname=xstarter
pkgver=0.7.0
_gitname=xstarter
pkgrel=1
epoch=
pkgdesc="Application launcher for Linux"
arch=('any')
url="https://github.com/lchsk/xstarter"
license=('GPL')
groups=()
depends=('ncurses' 'glib2')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=('xstarter')
conflicts=('xstarter')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/lchsk/xstarter/releases/download/v0.7.0/xstarter-0.7.0-Linux.tar.gz)
noextract=()
md5sums=(2ddeb05f8591ba7f204c46f7d5df0225)
validpgpkeys=()

package() {
    cd "$srcdir"

    install -Dm755 "$srcdir"/xstarter-"$pkgver"-Linux/bin/xstarter "$pkgdir"/usr/bin/xstarter
    install -Dm644 "$srcdir"/xstarter-"$pkgver"-Linux/share/man/man1/xstarter.1 "$pkgdir"/usr/share/man/man1/xstarter.1
}
