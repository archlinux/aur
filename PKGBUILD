# Maintainer: Thenujan Sandramohan <sthenujan2002@gmail.com>
pkgname=grub-editor
pkgver=0.96
pkgrel=1
epoch=
pkgdesc="GUI to edit grub configurations"
arch=('any')
url="https://github.com/Thenujan-0/grub-editor"
license=('GPL3')
groups=()
depends=('python>=3.8' 'python-pyzmq')
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Thenujan-0/grub-editor/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
    echo $pwd
        cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PKG_DIR="$pkgdir" install
}
