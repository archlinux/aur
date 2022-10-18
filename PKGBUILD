# Maintainer: Mitchell Augustin <mitchell@mitchellaugustin.com>
# Maintainer: Levi Pinkard <levipinkard@gmail.com>
pkgname=spiral-notebook-bin
pkgver=1.7
pkgrel=1
epoch=
pkgdesc="Free-form notebook software with 'click anywhere to type' functionality, rich-text and image support, and a notebook-based file structure"
arch=('x86_64')
url="https://mitchellaugustin.com/spiral/"
license=('GPL')
groups=()
depends=('qt5-base>=5.9.0', 'qt5-declarative>=5.9.0')
makedepends=()
checkdepends=()
optdepends=('qt5-styleplugins')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}versions/spiral-linux-${pkgver}.tar.gz")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	cd "spiral-linux-${pkgver}"
}

check() {
	cd "spiral-linux-${pkgver}"
}

package() {
	cd "spiral-linux-${pkgver}"
	install -Dm 755 Spiral.desktop "$pkgdir"/usr/share/applications/Spiral.desktop
	install -Dm 755 spiral "$pkgdir"/usr/bin/spiral
	install -Dm 755 spiral.png "$pkgdir"/usr/share/pixmaps/spiral.png
	mkdir -p "$pkgdir"/usr/share/spiral
	install -Dm 755 Demo.snb "$pkgdir"/usr/share/spiral/Demo.snb
	install -Dm 755 session.json "$pkgdir"/usr/share/spiral/session.json
}
