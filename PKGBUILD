
# Maintainer: claudemods
# Contributor: empty
pkgname=display-functions-claudemods
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="function for displays on plasma 6"
arch=('any')
url="https://github.com/claudemods/Display-Functions/releases/download/new/display-functions-claudemods-1.0.tar.gz"
license=('GPL')
groups=()
depends=(python python-pyqt6 qt6-base qt6-declarative)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=first version
source=("$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
	install -Dm755 Display-Functions.py "$pkgdir/usr/bin/Display-Functions"
	install -Dm644 main.qml "$pkgdir/usr/share/Display-Functions/main.qml"
	install -Dm644 Display-Functions.desktop "$pkgdir/usr/share/applications/Display-Functions.desktop"
	install -Dm644 Display-Functions.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/Display-Functions.png"
}
