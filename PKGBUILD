# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=glslang-sparzz-git
pkgver=8.13.3743.2020.05.25
pkgrel=1
epoch=
pkgdesc="glslang build from source"
arch=(x86_64)
url="https://github.com/KhronosGroup/glslang.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(glslang-sparzz-git)
conflicts=(glslang)
replaces=(glslang)
backup=()
options=()
install=
changelog=
source=("glslang::git+https://github.com/KhronosGroup/glslang.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake glslang
	make DESTDIR="$pkgdir" install
}
