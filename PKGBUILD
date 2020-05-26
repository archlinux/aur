# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=spirv-headers-sparzz-git
pkgver=1.5.3.2020.05.25
pkgrel=1
epoch=
pkgdesc="spirv headers from source"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-Headers.git"
license=('Apache')
groups=()
depends=()
makedepends=("cmake"
            "git")
checkdepends=()
optdepends=()
provides=(spirv-headers-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake SPIRV-Headers
	make DESTDIR="$pkgdir" install
}
