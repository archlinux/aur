# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Linuxtopia <linuxtopia20@gmail.com>
pkgname=calculator-git
pkgver=0.2
pkgrel=1
#epoch=
pkgdesc="calculator"
arch=('any')
url="https://gitlab.com/linuxtopia/calculator-git"
license=('GPL')
#groups=()
depends=('git')
#makedepends=()
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("git+https://gitlab.com/linuxtopia/calculator-git.git")
#noextract=()
md5sums=('SKIP')
#validpgpkeys=()

package() {
	cd "$pkgname"
	install -Dm755 calculator-git.sh ${pkgdir}/usr/bin/calculator-git
}
