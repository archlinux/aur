# Maintainer: steamport <steamport@tutanota.com>
pkgname=kristforge-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Kristforge is a cross-platform hardware accelerated GPU and CPU krist miner. Kristforge uses OpenCL and accelerated CPU instruction sets to maximize performance, making it the fastest krist miner in existence."
arch=('x86_64')
url="https://github.com/tmpim/kristforge"
license=('Apache-2.0')
groups=()
depends=('glibc' 'gcc-libs' 'openssl' 'zlib')
optdepends=('opencl-driver: GPU support')
makedepends=('unzip')
provides=('kristforge')
conflicts=('kristforge')
replaces=()
backup=()
options=()
install=
source=("https://github.com/tmpim/kristforge/releases/download/v${pkgver}/kristforge_linux.zip")
noextract=()
md5sums=('14cefc4b10e45b03887be551c7a44fc6')

package() {
	mkdir -p "$pkgdir/usr/bin"
	unzip kristforge_linux.zip -d "$pkgdir/usr/bin"
}
