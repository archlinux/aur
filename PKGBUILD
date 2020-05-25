# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=vulkan-extensionlayer-sparzz-git
pkgver=1.2.140.2020.05.25
pkgrel=1
epoch=
pkgdesc="vulkan extension layer build from source"
arch=(x86_64)
url="https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(vulkan-extensionlayer-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Vulkan-ExtensionLayer::git+https://github.com/KhronosGroup/Vulkan-ExtensionLayer.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake Vulkan-ExtensionLayer
	make DESTDIR="$pkgdir" install
}
