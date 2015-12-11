# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=asse-sparc-toolchain
pkgver=1.0
pkgrel=1
epoch=
pkgdesc=""
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
source=("https://lse.epita.fr/data/sparc-unknown-linux-gnu.tar.gz")
noextract=()
md5sums=("f96c99730faa1ab94a0b4a3365b28725")

package() {
	mkdir $pkgdir/opt/
	cp -ar $srcdir/sparc-unknown-linux-gnu $pkgdir/opt/
}
