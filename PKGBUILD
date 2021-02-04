# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Breno Cunha Queiroz <admin@brenocq.com>
pkgname=atta-git
pkgver=0.0.1.r13.14f4be7
pkgrel=1
epoch=
pkgdesc="Robot simulator for 2D and 3D applications made with Vulkan API (optional Ray Tracing) (early stages)"
arch=(x86_64 i686)
url="https://github.com/Brenocq/Atta.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

pkgver() {
	cd "${_pkgname}"	
	printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	echo "----- Build ----- "
	cd Atta
	pwd
	#./configure --prefix=/usr
	#make
}

check() {
	echo "----- Check ----- "
}

package() {
	echo "----- Package section ----- "
}
