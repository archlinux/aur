# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos <alfred@stensatter.se>
pkgname=taber-git
pkgver=2
pkgrel=1
epoch=
pkgdesc="This is a simple program that opens a new terminal from your current diriectory"
arch=(x86_64)
url="https://github.com/spynetS/taber"
license=('GL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    git clone $url gittab
}

package() {
	cd gittab
	install -Dm755 ./tab.sh "$pkgdir/usr/bin/tab"
}
