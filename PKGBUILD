# Author : ilnanny
# Maintainer: Your Name <youremail@domain.com>

pkgname=lila-hd
pkgver=1
pkgrel=1
epoch=
pkgdesc="Lila icon theme for Gnu-Linux and Unix-like O.S"
arch=(any)
url="http://gnome-look.org/content/show.php/Lila+HD?content=175412"
license=('CC BY-NC-ND 4.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://esclapion.free.fr/AUR/$pkgname-$pkgver.$pkgrel.tar.gz")
noextract=()
md5sums=('837130cd56d7b9cb70bf027829df06e1')
validpgpkeys=()

package() {
        mkdir -p $pkgdir/usr/share/icons/
        cp -r "$srcdir/Lila_HD" $pkgdir/usr/share/icons/
}
