# Maintainer: jurplel <jeep70cp[at]gmail[dotcom]>
pkgname=qview
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('xdg-utils: Used to open containing folder of file' 'qt5-imageformats: Extra image format support' 'qt5-svg: SVG support')
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jurplel/qView/releases/download/$pkgver/qView-$pkgver.tar.gz")
noextract=()
sha256sums=('81f36329c30e253466e21502a474dcdf16e55d644d6ac756e5923601b6aeba11')
validpgpkeys=()

build() {
	cd qView
	qmake
	make
}

package() {
	cd qView
	make INSTALL_ROOT="$pkgdir/" install
}
