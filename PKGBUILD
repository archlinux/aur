# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel <danilacasito8@gmail.com>
pkgname=cget
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A Curl and Python Based simple download command (SYNTAX: cget url file)"
arch=(x86_64)
url="https://pypi.org/project/notificationcenter"
license=('GPL')
groups=()
depends=(curl)
makedepends=(pyinstaller)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(ece7ffefa8ad86fcf005e03be4166c76)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

package() {
	cd "$pkgname-$pkgver"
	make install root=$pkgdir prefix=/usr
}
