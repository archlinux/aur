# Maintainer: jurplel <jurplel[at]interversehq[dotcom]>
pkgname=qview
pkgver=3.0
pkgrel=1
epoch=
pkgdesc="qView is a Qt image viewer designed with minimalism and usability in mind."
arch=('i686' 'x86_64')
url="https://interversehq.com/qview/"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: Extra image format support' 'qt5-svg: SVG support')
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
sha256sums=('8461e4dfdd7bc977ae908275c0ac00bedc2e78497becfd28c17fa8ac898f6100')
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
