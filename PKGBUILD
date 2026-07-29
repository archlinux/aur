# Maintainer: Kelvie Wong <kelvie@kelvie.ca>
pkgname=krita-vision-tools
pkgver=3.0.0
pkgrel=3
epoch=
pkgdesc="Krita plugin which adds selection tools to mask objects with a single click, or by drawing a bounding box. This version works with Krita 6.0 (based on Qt6)"
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
source=( "https://github.com/Acly/${pkgname}/releases/download/v${pkgver}-pre/${basefilename}-linux-x64-${pkgver}.zip" )
sha256sums=('b194ea8caa72f98c5bda907e3bb213cdf1d34c5a9dfd99a8818a052c07e7ca92')
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
