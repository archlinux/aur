# This fork of cryptsetup made by Albinoloverats
# Archlinux package contributor is Dimadenisjuk <dimadenisjuk@yandex.ru>
pkgname=('stegfs')
pkgver=2015.08.1
pkgrel=1
epoch=
pkgdesc="Cryptsetup version with 'Deniable encryption' support"
arch=('any')
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('stegfs')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/albinoloverats/stegfs#commit=5b2ae87")
#source=("git+https://github.com/albinoloverats/stegfs#commit=fffaf60")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	make CXXFLAGS="-Werror=implicit-fallthrough=0" CFLAGS="-Werror=implicit-fallthrough=0"
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/" install
}
