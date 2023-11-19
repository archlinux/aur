
pkgname=cnake-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Snake clone in c with standard lib"
arch=(x86_64)
url="https://github.com/spynetS/cnake"
license=('MIT')
groups=()
depends=()
makedepends=(gcc git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	git clone https://github.com/spynetS/cnake
}

build() {
	cd cnake
	exec ./build.sh
}

package() {
    cd cnake 
    install -Dm755 ./cnake "$pkgdir/usr/bin/cnake"
}
              
