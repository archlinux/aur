# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-headers-sparzz-git
pkgver=1.2.141.2020.05.25
pkgrel=1
epoch=
pkgdesc="vulkan headers build from source"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-Headers.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(vulkan-headers-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake Vulkan-Headers
	make DESTDIR="$pkgdir" install
}
