# Maintainer: Gabriel Laskar <gabriel@lse.epita.fr>
pkgname=asse-sparc-toolchain
pkgver=1.0
pkgrel=2
epoch=
pkgdesc="Toolchain for asm courses at epita"
arch=('x86_64')
url=""
license=('GPL')
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
install=
changelog=
source=("http://static.cri.epita.net/lse/sparc-unknown-linux-gnu.tar.gz")
noextract=()
md5sums=("f96c99730faa1ab94a0b4a3365b28725")

package() {
	mkdir $pkgdir/opt/
	cp -ar $srcdir/sparc-unknown-linux-gnu $pkgdir/opt/
}
