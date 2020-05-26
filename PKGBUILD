# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=glslang-sparzz-git
pkgver=8.13.3743.2020.05.26
pkgrel=1
epoch=
pkgdesc="glslang build from source. For better install instructions visit my GitHub page https://github.com/sparzz/vulkan-arch-aur it will provide the install order instruction for Vulkan API. Almost all the Vulkan packages from my AUR requires glslang"
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay")
makedepends=("cmake"
            "git"
            "make")
checkdepends=()
optdepends=()
provides=(glslang-sparzz-git)
conflicts=()
replaces=()
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
