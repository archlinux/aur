# Maintainer: Kelvie Wong <kelvie@kelvie.ca>
pkgname=krita-vision-tools
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Krita plugin which adds selection tools to mask objects with a single click, or by drawing a bounding box."
arch=( 'x86_64' )
url="https://github.com/Acly/krita-vision-tools"
license=('GPL')
groups=()
depends=( 'krita' 'kseexpr')
makedepends=( 'tar' )
checkdepends=()
optdepends=()
provides=()
conflicts=('krita-ai-tools') # old name, got renamed to this
replaces=()
backup=()
options=()
install=
changelog=
basefilename=krita_vision_tools
# e.g. https://github.com/Acly/krita-vision-tools/releases/download/v2.0.0/krita_vision_tools-linux-x64-2.0.0.zip
source=( "https://github.com/Acly/${pkgname}/releases/download/v${pkgver}/${basefilename}-linux-x64-${pkgver}.zip" )
sha256sums=('04bcc5877ee9a4bf1aef893267b3539f569a4ae5097d070156915a931cce0d70')
noextract=()
validpgpkeys=()


prepare() {
	cd "$srcdir"
}

build() {
	cd "$srcdir"
}

check() {
	cd "$srcdir"
}

package() {
	cd "$srcdir"
	cp -a usr "$pkgdir"
}
