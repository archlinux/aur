# Maintainer: Paul Knopf <pauldotknopf@gmail.com>
pkgname=darch
pkgver=0.5.0
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
md5sums=('815b8c34f3ab94e25ecd7e402caef51c')
noextract=()
validpgpkeys=()
package() {
	install -d $pkgdir/usr/bin
	install darch $pkgdir/usr/bin
	install -d $pkgdir/etc/grub.d/
	install grub-mkconfig-script $pkgdir/etc/grub.d/60_darch
}
