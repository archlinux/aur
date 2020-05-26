# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-loader-git
pkgver=1.2.140.2020.05.25
pkgrel=1
epoch=
pkgdesc="vulkan loader build from source"
arch=(x86_64)
url=""
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git"
            "vulkan-headers-sparzz-git")
checkdepends=()
optdepends=()
provides=(vulkan-loader-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-Loader::git+https://github.com/KhronosGroup/Vulkan-Loader.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake Vulkan-Loader
	make DESTDIR="$pkgdir" install
}
