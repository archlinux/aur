# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch
pkgver=0.25.0
pkgrel=1
epoch=
pkgdesc="A utility to that uses containerd to build stateless operating system images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/godarch/darch"
license=('MIT')
groups=()
depends=('libseccomp', 'containerd')
makedepends=()
checkdepends=()
optdepends=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/godarch/darch/archive/v$pkgver.tar.gz")
md5sums=('79e8f497d8e761e15245290b040a4dcc')
noextract=()
validpgpkeys=()
package() {
	# The tarball has all the directories setup correctly.
	make install DESTDIR=$pkgdir
}
