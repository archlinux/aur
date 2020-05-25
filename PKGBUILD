# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-tools-git
pkgver=1.2.140.2020.05.25
pkgrel=1
epoch=
pkgdesc="vulkan tools build directly from KhronosGroup github. This build provide the most recent vulkan-tools package"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-Tools.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(vulkan-tools-git)
conflicts=(vulkan-tools)
replaces=(vulkan-tools)
backup=()
options=()
install=
changelog=
source=("Vulkan-Tools::git+https://github.com/KhronosGroup/Vulkan-Tools.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake Vulkan-Tools
	make DESTDIR="$pkgdir" install
}
