# Maintainer: Devin Hill <lvlrk4u@proton.me>
pkgname=terxels
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="A super easy-to-use header-only library to freely output pixels in an ANSI terminal"
arch=('any')
url="https://github.com/haedqu/terxels"
license=('MIT')
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
install=.INSTALL
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(6e2343f4e05e15ae0f0afe9233b69eb2)
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
	make clean lib
}

package() {
	cd "$pkgname-$pkgver"
	sudo make DESTDIR="$pkgdir/" lib-install
}
