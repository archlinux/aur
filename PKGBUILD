# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Rob Bolton <rob.a.bolton@gmail.com>
pkgname=es-shell
pkgver=0.9.2
pkgrel=1
epoch=
pkgdesc="Extensible Shell, a shell based on Plan 9's rc shell, influenced by functional languages."
arch=('any')
url="http://wryun.github.io/es-shell/"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=es-shell.install
changelog=
source=("https://github.com/wryun/es-shell/releases/download/v$pkgver/es-$pkgver.tar.gz")
noextract=()
md5sums=("caa8347ee5bb38435cf8cf7e736e4a99")
validpgpkeys=()

build() {
	./configure --prefix=/usr
	make
}

package() {
make prefix="$pkgdir/usr" install
}

