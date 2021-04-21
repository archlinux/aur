# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cget
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A Curl and Python Based simple download command"
arch=(x86_64)
url="https://pypi.org/project/notificationcenter"
license=('GPL')
groups=()
depends=(python)
makedepends=(python python-setuptools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(643a231681539c73f8b27f7020802e26)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

package() {
	cd "$pkgname-$pkgver"
	make install root=$pkgdir prefix=/usr
}
