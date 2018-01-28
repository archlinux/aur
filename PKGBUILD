# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="A utility to that uses Docker to build stateless Arch images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/pauldotknopf/darch"
license=('MIT')
groups=()
depends=("containerd")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/pauldotknopf/darch/releases/download/v$pkgver/darch-amd64.tar.gz")
md5sums=('b115316e8a722a21555d48c064ae89d1')
noextract=()
validpgpkeys=()
package() {
	# The tarball has all the directories setup correctly.
	cp * -r $pkgdir
}
