# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch
pkgver=0.8.0
pkgrel=1
epoch=
pkgdesc="A utility to that uses Docker to build stateless Arch images that can be booted bare-metal."
arch=('x86_64')
url="https://github.com/pauldotknopf/darch"
license=('MIT')
groups=()
depends=("docker")
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
md5sums=('2a9f28ac80b3b898e42481ae040e0df9')
noextract=()
validpgpkeys=()
package() {
	# The tarball has all the directories setup correctly.
	cp * -r $pkgdir
}
