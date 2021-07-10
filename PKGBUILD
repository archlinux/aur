# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ninni <soelder@hotmail.com.com>
pkgname=humble-lumpia-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A script for managing installations of Glorious Eggroll's custom proton build "
arch=('any')
url="https://github.com/chuck-flowers/humble-lumpia"
license=('GPL3')
groups=()
depends=("sh")
makedepends=("git" "make")
checkdepends=()
optdepends=()
provides=()
conflicts=("humble-lumpia")
replaces=("humble-lumpia")
backup=()
options=()
install=
changelog=
source=("git+https://github.com/chuck-flowers/humble-lumpia.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

package() {
	cd "humble-lumpia"
	make PREFIX="$pkgdir/usr" install
}
