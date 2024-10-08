# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ivaylo Bachvarov <ISBachvarov21@codingburgas.bg>
pkgname=rune-cpp-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A C++ framework for developing REST APIs with a focus on simplicity and speed."
arch=(x86_64 i686)
url="https://github.com/ISBachvarov21/Rune.git"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=(rune-cpp)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  mkdir build
  cmake -S . -B build
  cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
	sudo cmake --install build --prefix /usr
}
sha256sums=('SKIP')
