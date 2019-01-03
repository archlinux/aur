# Maintainer: jurplel <jeep70cp[at]gmail[dotcom]>
pkgname=qview
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="Practical and mimimal image viewer"
arch=('i686' 'x86_64')
url="https://intvhq.com/qview"
license=('GPL3')
groups=()
depends=('qt5-base>=5.9' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: Additional image format support' 'qt5-svg: SVG support')
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
sha256sums=('4afb4b0f3efa779a08057fc77c7f614171deb12bb89275215a2867bcae7a0b67')
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
