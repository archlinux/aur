# Maintainer: Thenujan Sandramohan <sthenujan2002@gmail.com>
pkgname=grub-editor
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="GUI application to edit grub configurations"
arch=('any')
url="https://github.com/Thenujan-0/grub-editor"
license=('GPL3')
groups=()
depends=('python' 'grub' 'python-pyqt5')
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
    cd "$pkgname-$pkgver"
    make PKG_DIR="$pkgdir" install
}
