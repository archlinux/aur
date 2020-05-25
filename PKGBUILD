# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=libcxx-sparzz-git
pkgver=1.alpha.test
pkgrel=1
epoch=
pkgdesc="libcxx build from llvm github"
arch=(x86_64)
url="https://github.com/llvm/llvm-project.git"
license=('GPL')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(libcxx-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("llvm-project::git+https://github.com/llvm/llvm-project.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake llvm-project/libcxx
	make DESTDIR="$pkgdir" install
}
