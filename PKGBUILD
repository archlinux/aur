# Maintainer: grgergo <csakbek@freemail.hu>
pkgname=editas
pkgver=20220525
pkgrel=1
epoch=
pkgdesc="sudoedit alternative for OpenDoas"
arch=("any")
url="https://aur.archlinux.org/cgit/aur.git/tree/editas?h=editas"
license=('GPL')
groups=()
depends=("doas")
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
source=("$pkgname")
noextract=("$pkgname")
md5sums=("320ebd47abe1e647a935f7dff73d5ae0")
validpgpkeys=()

BUILDENV+=("!check" "!extract")

package() {
	install -Dm775 $pkgname $pkgdir/usr/bin/$pkgname 
}
