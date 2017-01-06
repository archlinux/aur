# Maintainer: Simon Bachmann <simonbachmann@bluewin.ch>
pkgname=imgtools
pkgver=0.2
pkgrel=2
epoch=
pkgdesc="A Tk extension to scale and rotate photo images"
arch=('x86_64')
url="http://tkimgtools.sourceforge.net/index.html"
license=('BSD')
groups=()
depends=('tk>=8.6' )
makedepends=()
checkdepends=()
optdepends=('tkimg: support for more image formats')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://sourceforge.net/projects/tkimgtools/files/$pkgver/$pkgname-$pkgver.tar.gz/download")
noextract=()
md5sums=('ea0639257c9a142afc96d6ba39bb5ed4')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}


